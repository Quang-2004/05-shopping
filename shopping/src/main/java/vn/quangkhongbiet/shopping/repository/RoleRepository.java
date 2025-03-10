package vn.quangkhongbiet.shopping.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.quangkhongbiet.shopping.domain.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long>{
    Role findByName(String name);
}
