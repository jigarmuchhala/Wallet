package com.repay.wallet.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class TxnType {

    /**
     */
    @NotNull
    @Column(name = "txnTypeId", unique = true)
    private int txnTypeId;

    /**
     */
    private String txnTypeName;
}
