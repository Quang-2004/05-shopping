package vn.quangkhongbiet.shopping.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.quangkhongbiet.shopping.domain.ImageDetail;
import vn.quangkhongbiet.shopping.domain.Product;
import vn.quangkhongbiet.shopping.repository.ImageDetailRepository;

@Service
public class ImageDetailService {
    private final ImageDetailRepository imageDetailRepository;

    public ImageDetailService(ImageDetailRepository imageDetailRepository) {
        this.imageDetailRepository = imageDetailRepository;
    }
    
    public List<ImageDetail> findByProduct(Product product){
        return this.imageDetailRepository.findByProduct(product);
    }

    public void save(ImageDetail imageDetail){
        this.imageDetailRepository.save(imageDetail);
    }
}
