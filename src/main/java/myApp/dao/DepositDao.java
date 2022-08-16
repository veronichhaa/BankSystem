package myApp.dao;
import myApp.model.Deposit;

import org.springframework.data.jpa.repository.JpaRepository;

public interface DepositDao extends JpaRepository<Deposit, Long> {
    Deposit findByUsername(String username);
    Iterable<Deposit> findAllByUsername(String username);
}
