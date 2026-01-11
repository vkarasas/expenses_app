package com.expenses.repositories;

import com.expenses.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    User findUserByUsernameAndEnabled(String username, Boolean enabled);

    Optional<User> findBySubIdAndProvider(String subId, String provider);
}
