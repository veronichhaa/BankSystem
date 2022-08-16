package myApp.dao;
import myApp.model.Credit;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CreditDao extends JpaRepository<Credit, Long> {
    Credit findByUsername(String username);
    Iterable<Credit> findAllByUsername(String username);
}
