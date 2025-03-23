package vn.quangkhongbiet.shopping.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import vn.quangkhongbiet.shopping.domain.User;

@Repository 
public interface UserRepository extends JpaRepository<User, Long>, JpaSpecificationExecutor<User>{

    @SuppressWarnings("unchecked")
    User save(User user);

    User findById(long id);
    
    User findByEmail(String email);

    boolean existsByEmail(String email);

} 