package com.example.demo12.service.impl;

import com.example.demo12.DAO.BookRepository;
import com.example.demo12.model.Book;
import com.example.demo12.service.ICRUDService;

import java.util.ArrayList;

//public class BookService implements ICRUDService<Book> {
//    BookRepository bookRepository = new BookRepository();
//    @Override
//    public Book findById(int id) {
//        return bookRepository.findById(id);
//    }
//
//    @Override
//    public ArrayList<Book> findAll() {
//        return bookRepository.findAll();
//    }
//
//    @Override
//    public void create(Book book) {
//        bookRepository.create(book);
//    }
//
//    @Override
//    public void update(Book book) {
//        bookRepository.update(book);
//    }
//
//    @Override
//    public void deleteById(int id) {
//        bookRepository.deleteById(id);
//    }
//    public ArrayList<Book> findBookByName(String name) {
//        return bookRepository.searchByLikeName(name);
//    }
//    public ArrayList<Book> findBookByLocation(int id) {
//        return bookRepository.searchByLocation(id);
//    }
//
//    public ArrayList<Book> findBookByCategory(int id) {
//        return bookRepository.searchByCategory(id);
//    }
//    public ArrayList<Book> findBookByPub(int id) {
//        return bookRepository.searchByPublishing(id);
//    }
//    public int searchIdLocationByBook(int id){
//        return bookRepository.searchIdLocation(id);
//    }
//
//}

public class BookService implements ICRUDService<Book> {
    BookRepository bookRepository = new BookRepository();
    @Override
    public Book findById(int id) {
        return bookRepository.findById(id);
    }

    @Override
    public ArrayList<Book> findAll() {
        return bookRepository.findAll();
    }

    @Override
    public void create(Book book) {
        bookRepository.create(book);
    }

    @Override
    public void update(Book book) {
        bookRepository.update(book);
    }

    @Override
    public void deleteById(int id) {
        bookRepository.deleteById(id);
    }
    public ArrayList<Book> findBookByName(String name) {
        return bookRepository.searchByLikeName(name);
    }
    public ArrayList<Book> findBookByLocation(int id) {
        return bookRepository.searchByLocation(id);
    }

    public ArrayList<Book> findBookByCategory(int id) {
        return bookRepository.searchByCategory(id);
    }
    public ArrayList<Book> findBookByPub(int id) {
        return bookRepository.searchByPublishing(id);
    }
    public int searchIdLocationByBook(int id){
        return bookRepository.searchIdLocation(id);
    }
    public ArrayList<Book> statisticsBookByCategory(){
        return bookRepository.statisticsBookByCategory();
    }
    public ArrayList<Book> statisticsBookByStatus(){
        return bookRepository.statisticsBookByStatus();
    }
    public ArrayList<Book> statisticsBookByLocation(){
        return bookRepository.statisticsBookByLocation();
    }
}
