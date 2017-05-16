package com.repay.wallet.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class UserDtls {

    /**
     */
    @NotNull
    @Column(name = "userId", unique = true)
    private int userId;

    /**
     */
    private String userName;
}
