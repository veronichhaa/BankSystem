package myApp.dao;
import myApp.model.Card;
import org.springframework.data.jpa.repository.JpaRepository;


public interface CardDao extends JpaRepository<Card, Long> {
    Card findByUsername(String username);
}
