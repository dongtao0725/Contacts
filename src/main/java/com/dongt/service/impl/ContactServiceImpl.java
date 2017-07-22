package com.dongt.service.impl;

import com.dongt.dao.ContactDao;
import com.dongt.domain.Contact;
import com.dongt.service.ContactService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("ContactService")
public class ContactServiceImpl implements ContactService {

    @Resource
    private ContactDao contactDao;

    public List<Contact> getContactsByDeptID(Integer dept_id){
        return contactDao.getContactsByDeptID(dept_id);
    }
    public List<Contact> getContactsByName(String name){
        return  contactDao.getContactsByName(name);
    }
    public Integer addContact(Contact contact){
        return  contactDao.addContact(contact);
    }
    public Integer updateContact(Contact contact){
        return contactDao.updateContact(contact);
    }
    public Integer deleteContact(Integer c_id){
        return  contactDao.deleteContact(c_id);
    }
}
