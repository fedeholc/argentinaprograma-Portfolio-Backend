 
package com.portfolio.SpringBoot.repository;

 
import com.portfolio.SpringBoot.model.Idioma;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository 
public interface IdiomaRepository extends JpaRepository <Idioma, Long> { 
    
}
