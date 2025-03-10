package vn.quangkhongbiet.shopping.service;

import org.springframework.stereotype.Service;

import vn.quangkhongbiet.shopping.domain.Role;
import vn.quangkhongbiet.shopping.repository.RoleRepository;

@Service
public class RoleService {
    private final RoleRepository roleRepository;

    public RoleService(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }
    
    public Role findByName(String name){
        return this.roleRepository.findByName(name);
    }
}
