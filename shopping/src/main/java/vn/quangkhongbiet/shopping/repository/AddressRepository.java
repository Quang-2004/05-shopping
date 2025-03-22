package vn.quangkhongbiet.shopping.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.quangkhongbiet.shopping.domain.Address;
import vn.quangkhongbiet.shopping.domain.User;

import java.util.List;

@Repository
public interface AddressRepository extends JpaRepository<Address, Long>{

    @SuppressWarnings("unchecked")
    Address save(Address address);
    
    List<Address> findByUser(User user);

    boolean existsByUser(User user);

    Address findByDefaultAddressAndUser(boolean defaultAddress, User user);

    Address findById(long id);
}
