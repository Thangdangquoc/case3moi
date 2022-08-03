package com.example.demo12.controller;

import com.example.demo12.model.*;
import com.example.demo12.service.impl.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.regex.Pattern;



@WebServlet(name = "LoginServlet", urlPatterns = "/loginServlet")
public class LoginServlet extends HttpServlet {
    private static String this_email;

    public static String getId_email() {
        return this_email;
    }

    BookService bookService = new BookService();
    UserService userService = new UserService();
    LocationService locationService = new LocationService();
    CategoryService categoryService = new CategoryService();
    PublishingCompanyService publishingCompanyService = new PublishingCompanyService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login":
                showLoginForm(request,response);
                break;
            case "sign":
                showCreateForm(request, response);
                break;
            case "updateUser":
                showCreateUForm(request,response);
                break;
            case "statisticsC":
                ArrayList<Book> books = bookService.statisticsBookByCategory();
                showStatisticsLForm(books,request,response);
                break;
            case "statisticsStatus":
                ArrayList<Book> booksByStatus = bookService.statisticsBookByStatus();
                showStatisticsLForm(booksByStatus,request,response);
                break;
            case "statisticsL":
                ArrayList<Book> booksByLocation = bookService.statisticsBookByLocation();
                showStatisticsLForm(booksByLocation,request,response);
                break;
            default:
                ArrayList<Book> bookServiceAll = bookService.findAll();
                displayAllBook(bookServiceAll,request,response);
                break;

        }
    }
    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login":
                login(request, response);
                break;
            case "sign":
                sign(request, response);
                break;
            case "updateUser":
                updateUser(request,response);
                break;
            case "searchBookByName":
                searchBookByName(request,response);
                break;
            case "searchByLocation":
                searchBookByLocation(request,response);
                break;
            case "searchByCategory":
                searchBookByCategory(request,response);
                break;
            case "searchByPub":
                searchBookByPublishing(request,response);
                break;
            case "detailLocation":
                searchDetailLocation(request,response);
                break;

        }}

    private void showStatisticsLForm( ArrayList<Book> books,HttpServletRequest request, HttpServletResponse response) {

        request.setAttribute("statistics",books);

        RequestDispatcher dispatcher = request.getRequestDispatcher("book/statistics.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
    private void sign(HttpServletRequest request, HttpServletResponse response){
        String email = request.getParameter("email");
        String password = request.getParameter("pass");

        Pattern pattern = Pattern.compile("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{6,}$");
        if (pattern.matcher(password).find()) {
            try {
                if (!isExitUser(email)) {
                    UserService userService = new UserService();
                    User user = new User(email, password);
                    userService.create(user);
                    response.sendRedirect("/loginServlet?action=login");
                } else {
                    request.setAttribute("message", "Account already exists!");
                    request.getRequestDispatcher("user/create.jsp").forward(request, response);

                }
            } catch (Exception e) {
                System.out.println();
            }
        } else{
            request.setAttribute("message", "Password must be 6 characters!");
            try {
                request.getRequestDispatcher("user/create.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
    private void login (HttpServletRequest request, HttpServletResponse response){
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        try {
            if (isExitUser(email, password)) {
                this_email = email;
                response.sendRedirect("/bookServlet?action=");
            } else {
                request.setAttribute("message","\n" +
                        "Incorrect account or password!");
                request.getRequestDispatcher("user/login.jsp").forward(request,response);
            }

        } catch (Exception e) {
            System.out.println();
        }

    }
    private boolean isExitUser (String email, String password){
        UserService userService = new UserService();
        ArrayList<User> users = userService.findAll();
        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getEmail().equals(email) && users.get(i).getPassword_user().equals(password)) {
                return true;
            }
        }
        return false;
    }
    private boolean isExitUser (String email){
        UserService userService = new UserService();
        ArrayList<User> users = userService.findAll();
        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getEmail().equals(email)) {
                return true;
            }
        }
        return false;
    }
    private void showLoginForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/login.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
    private void displayAllBook(ArrayList<Book> books,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/default.jsp");
        ArrayList<Location> locations = locationService.findAll();
        ArrayList<Category> categories = categoryService.findAll();
        ArrayList<PublishingCompany> publishingCompanies = publishingCompanyService.findAll();
        request.setAttribute("locations", locations);
        request.setAttribute("categories", categories);
        request.setAttribute("publishingCompanies", publishingCompanies);
        request.setAttribute("books", books);
        requestDispatcher.forward(request, response);
    }

    private void showCreateUForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = userService.findByEmail(this_email);
        request.setAttribute("u",user);
        request.getRequestDispatcher("user/update.jsp").forward(request,response);
    }


    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String birth = request.getParameter("date");
        LocalDate birth1 = null;
        if (birth != ""){
            birth1 = LocalDate.parse(birth, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        }
        String pass = request.getParameter("pass");
        String phone = request.getParameter("phone");
        String image = request.getParameter("image");
        User user = new User(name,email,pass,birth1,phone,image);
        userService.update(user);
        response.sendRedirect("/bookServlet?action=");
    }
    private void searchBookByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("search");
        String likeName = "%"+name+"%";
        ArrayList<Book> bookByName =  bookService.findBookByName(likeName);
        if (bookByName.isEmpty()){
            request.setAttribute("messager","Not found!");
            ArrayList<Book> books = bookService.findAll();
            displayAllBook(books,request,response);
        }else {
            displayAllBook(bookByName,request,response);
        }
    }
    private void searchBookByLocation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("locations"));
        ArrayList<Book> books =  bookService.findBookByLocation(id);
        if (books.isEmpty()){
            request.setAttribute("messagerL","Not found!");
            ArrayList<Book> bookArrayList = bookService.findAll();
            displayAllBook(bookArrayList,request,response);
        }else {
            displayAllBook(books,request,response);
        }

    }
    private void searchBookByCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("categories"));
        ArrayList<Book> books =  bookService.findBookByCategory(id);
        if (books.isEmpty()){
            request.setAttribute("messagerC","Not found!");
            ArrayList<Book> bookArrayList = bookService.findAll();
            displayAllBook(bookArrayList,request,response);

        }else {
            displayAllBook(books,request,response);
        }

    }
    private void searchBookByPublishing(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("publishingCompanies"));
        ArrayList<Book> books = bookService.findBookByPub(id);
        if (books.isEmpty()) {
            request.setAttribute("messagerP", "Not found!");
            ArrayList<Book> bookArrayList = bookService.findAll();
            displayAllBook(bookArrayList,request,response);

        } else {
            displayAllBook(books,request,response);
        }
    }

    private void searchDetailLocation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("detailLocation"));
        Location location = locationService.findById(id);
        request.setAttribute("l",location);
        request.getRequestDispatcher("location/detail.jsp").forward(request,response);

    }



}
