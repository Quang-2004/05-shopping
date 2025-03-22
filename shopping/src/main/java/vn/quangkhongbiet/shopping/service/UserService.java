package vn.quangkhongbiet.shopping.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import vn.quangkhongbiet.shopping.domain.User;
import vn.quangkhongbiet.shopping.domain.DTO.RegisterDTO;
import vn.quangkhongbiet.shopping.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;
    
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User findById(long id){
        return this.userRepository.findById(id);
    }

    public User findByEmail(String email){
        return this.userRepository.findByEmail(email);
    }

    public Page<User> findAll(Pageable pageable){
        return this.userRepository.findAll(pageable);
    }

    public void save(User user){
        this.userRepository.save(user);
    }

    public void delete(User user){
        this.userRepository.delete(user);
    }

    public boolean checkEmailExist(String email){
        return this.userRepository.existsByEmail(email);
    }

    public User registerDTOtoUser(RegisterDTO registerDTO){ 
        User user = new User();
        user.setFullName(registerDTO.getFirstName() + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        return user;
    }
}
