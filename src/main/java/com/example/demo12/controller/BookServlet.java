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
import java.util.ArrayList;



@WebServlet(name = "BookServlet", value = "/bookServlet")
public class BookServlet extends HttpServlet {


    private final UserService userService = new UserService();

    private final BookService bookService = new BookService();
    private final CategoryService categoryService = new CategoryService();
    private final LocationService locationService = new LocationService();
    private final PublishingCompanyService publishingCompanyService = new PublishingCompanyService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                createBookGet(request, response);
                break;
            case "delete":
                deleteBookGet(request, response);
                break;
            case "update":
                updateBookGet(request, response);
                break;
            case "detail":
                detailBook(request, response);
                break;
            case "detailNotLogin":
                detailBookNotLogin(request,response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action =  request.getParameter("action");
        switch (action) {
            case "create":
                createBookPost(request, response);
                break;
            case "update":
                updateBookPost(request, response);
                break;
            case "createC":
                createCategory(request,response);
                break;
            case "createL":
                createLocation(request,response);
                break;
            case "createP":
                createPublishingCompany(request,response);
                break;
            case "delete":
                deleteBook(request,response);
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
        }
    }

    private void showStatisticsLForm( ArrayList<Book> books,HttpServletRequest request, HttpServletResponse response) {

        request.setAttribute("statistics",books);

        RequestDispatcher dispatcher = request.getRequestDispatcher("book/statisticsAfterLogin.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
    private void searchDetailLocation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("detailLocation"));
        Location location = locationService.findById(id);
        request.setAttribute("l",location);
        request.getRequestDispatcher("location/detail.jsp").forward(request,response);

    }
    private void searchBookByPublishing(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("publishingCompanies"));
        ArrayList<Book> books = bookService.findBookByPub(id);
        if (books.isEmpty()) {
            request.setAttribute("messagerP", "Khong co thong tin!");
            ArrayList<Book> bookArrayList = bookService.findAll();
            displayAllBook(bookArrayList,request,response);

        } else {
            displayAllBook(books,request,response);
        }
    }
    private void searchBookByCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("categories"));
        ArrayList<Book> books =  bookService.findBookByCategory(id);
        if (books.isEmpty()){
            request.setAttribute("messagerC","Khong co thong tin!");
            ArrayList<Book> bookArrayList = bookService.findAll();
            displayAllBook(bookArrayList,request,response);

        }else {
            displayAllBook(books,request,response);
        }

    }
    private void searchBookByLocation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("locations"));
        ArrayList<Book> books =  bookService.findBookByLocation(id);
        if (books.isEmpty()){
            request.setAttribute("messagerL","Khong co thong tin!");
            ArrayList<Book> bookArrayList = bookService.findAll();
            displayAllBook(bookArrayList,request,response);
        }else {
            displayAllBook(books,request,response);
        }

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
    private void createCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        Category category = new Category(name);
        categoryService.create(category);
        createBookGet(request,response);
    }
    private void createPublishingCompany(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        PublishingCompany publishingCompany = new PublishingCompany(name);
        publishingCompanyService.create(publishingCompany);
        createBookGet(request,response);
    }





    private void createLocation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String painted = request.getParameter("painted");
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        Location location = new Location(name,painted,capacity,amount);
        locationService.create(location);
        createBookGet(request,response);
    }
    private void deleteBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        int id_location = bookService.searchIdLocationByBook(id);
        Location location = locationService.findById(id_location);
        bookService.deleteById(id);
        location.setAmount(location.getAmount()-1);
        locationService.update(location);
        response.sendRedirect("/bookServlet?action=");

    }
    private void deleteBookGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("book/delete.jsp");
        Book book = bookService.findById(id);
        request.setAttribute("b",book);
        requestDispatcher.forward(request,response);
    }
    private void detailBookNotLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("book/detailNotLogin.jsp");
        Book book = bookService.findById(id);
        request.setAttribute("b",book);
        requestDispatcher.forward(request,response);
    }
    private void detailBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("book/detail.jsp");
        Book book = bookService.findById(id);
        request.setAttribute("b",book);
        requestDispatcher.forward(request,response);
    }
    private void updateBookGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Book book = bookService.findById(id);
        ArrayList<Category> categories = categoryService.findAll();
        ArrayList<PublishingCompany> publishingCompanies = publishingCompanyService.findAll();
        ArrayList<Location> locations = locationService.findByAmount();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("book/edit.jsp");
        request.setAttribute("b", book);
        request.setAttribute("categories", categories);
        request.setAttribute("writers", publishingCompanies);
        request.setAttribute("locations", locations);
        requestDispatcher.forward(request, response);
    }
    private void updateBookPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id_book = Integer.parseInt(request.getParameter("id"));
        int id_location_old = bookService.searchIdLocationByBook(id_book);
        String name = request.getParameter("name");
        String describe = request.getParameter("describe");
        String image = request.getParameter("image");
        String status = request.getParameter("status");
        int categoryId = Integer.parseInt(request.getParameter("category"));
        Category category = categoryService.findById(categoryId);
        int writerId = Integer.parseInt(request.getParameter("writer"));
        PublishingCompany publishingCompany = publishingCompanyService.findById(writerId);
        int locationId = Integer.parseInt(request.getParameter("location"));

        Location locationNew = locationService.findById(locationId);

        if (id_location_old != locationId){
            Location locationOld = locationService.findById(id_location_old);
            locationOld.setAmount(locationOld.getAmount()-1);
            locationNew.setAmount(locationNew.getAmount()+1);
            locationService.update(locationNew);
            locationService.update(locationOld);
        }
        Book book = new Book(id_book,name, describe,image,status,category,publishingCompany,locationNew);
        bookService.update(book);
        response.sendRedirect("/bookServlet?action=");
    }

    private void createBookGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("book/create.jsp");
        ArrayList<Category> categories = categoryService.findAll();
        ArrayList<PublishingCompany> publishingCompanies = publishingCompanyService.findAll();
        ArrayList<Location> locations = locationService.findByAmount();;
        request.setAttribute("categories", categories);
        request.setAttribute("writers", publishingCompanies);
        request.setAttribute("locations", locations);
        requestDispatcher.forward(request, response);
    }

    private void createBookPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        String describe = request.getParameter("describe");
        String image = request.getParameter("image");
        String status = request.getParameter("status");
        if (name == "" || describe == "" || image== "" || status == ""){
            request.setAttribute("messenger","The information has not been filled in completely!");
            createBookGet(request,response);
        }else {
            int categoryId = Integer.parseInt(request.getParameter("category"));
            Category category = categoryService.findById(categoryId);
            int writerId = Integer.parseInt(request.getParameter("writer"));
            PublishingCompany publishingCompany = publishingCompanyService.findById(writerId);
            int locationId = Integer.parseInt(request.getParameter("location"));
            Location location = locationService.findById(locationId);
            location.setAmount(location.getAmount()+1);
            locationService.update(location);
            Book book = new Book(name,describe,image,status,category,publishingCompany,location);
            bookService.create(book);
            response.sendRedirect("/bookServlet?action=");
        }

    }
    private void displayAllBook(ArrayList<Book> books,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("email", LoginServlet.getId_email());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("book/display.jsp");
        ArrayList<Location> locations = locationService.findAll();
        ArrayList<Category> categories = categoryService.findAll();
        ArrayList<PublishingCompany> publishingCompanies = publishingCompanyService.findAll();
        request.setAttribute("locations", locations);
        request.setAttribute("categories", categories);
        request.setAttribute("publishingCompanies", publishingCompanies);
        request.setAttribute("books", books);
        requestDispatcher.forward(request, response);
    }




}
