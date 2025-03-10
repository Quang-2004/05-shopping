package vn.quangkhongbiet.shopping.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.quangkhongbiet.shopping.domain.User;

@Repository 
public interface UserRepository extends JpaRepository<User, Long>{
    User findById(long id);
    
    User findByEmail(String email);

    boolean existsByEmail(String email);

} 