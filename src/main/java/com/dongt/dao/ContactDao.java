package com.dongt.dao;

import com.dongt.domain.Contact;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ContactDao {
    List<Contact> getContactsByDeptID(Integer dept_id);
    List<Contact> getContactsByName(String name);
    Integer addContact(Contact contact);
    Integer updateContact(Contact contact);
    Integer deleteContact(Integer c_id);
}
