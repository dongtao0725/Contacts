package com.dongt.service;

import com.dongt.domain.Contact;

import java.util.List;

public interface ContactService {
    public List<Contact> getContactsByDeptID(Integer dept_id);
    public List<Contact> getContactsByName(String name);
    public Integer addContact(Contact contact);
    public Integer updateContact(Contact contact);
    public Integer deleteContact(Integer c_id);
}
