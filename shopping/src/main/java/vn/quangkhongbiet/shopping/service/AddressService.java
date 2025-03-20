package vn.quangkhongbiet.shopping.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.quangkhongbiet.shopping.domain.Address;
import vn.quangkhongbiet.shopping.domain.User;
import vn.quangkhongbiet.shopping.repository.AddressRepository;

@Service
public class AddressService {
    private final AddressRepository addressRepository;

    public AddressService(AddressRepository addressRepository) {
        this.addressRepository = addressRepository;
    }

    public void save(Address address){ 
        this.addressRepository.save(address);
    }

    public List<Address> findByUser(User user){ 
        return this.addressRepository.findByUser(user);
    }

    public boolean existsByUser(User user){ 
        return this.addressRepository.existsByUser(user);
    }

    public Address findByDefaultAddressAndUser(boolean defaultAddress, User user){ 
        return this.addressRepository.findByDefaultAddressAndUser(defaultAddress, user);
    }

    public Address findById(long id){ 
        return this.addressRepository.findById(id);
    }
    
    public void handleChangeDefaultAddress(User user){ 
        Address address = this.addressRepository.findByDefaultAddressAndUser(true, user);
        address.setDefaultAddress(false);
        this.addressRepository.save(address);
    }
}
