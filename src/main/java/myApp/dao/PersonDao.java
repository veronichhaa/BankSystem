package myApp.dao;

import myApp.model.Person;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PersonDao extends JpaRepository<Person, Long> {
    Person findByUsername(String username);
//    Person findByUsernameOrCreate(String username);
    Person findById(Long id);
}
