package myApp.service;

import myApp.model.User;

public interface UserService {

    void save(User user);

    User findByUsername(String username);

}
