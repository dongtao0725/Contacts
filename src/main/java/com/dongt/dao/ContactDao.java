package com.dongt.dao;

import com.dongt.domain.Contact;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ContactDao {
    public List<Contact> getContactsByDeptID(Integer dept_id);
    public List<Contact> getContactsByID(Integer c_id);
    public Integer addContact(Contact contact);
    public Integer updateContact(Contact contact);
    public Integer deleteContact(Integer c_id);
}
