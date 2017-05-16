package com.repay.wallet.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.persistence.ManyToOne;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Wallet {

    /**
     */
    @NotNull
    @Column(name = "walletId", unique = true)
    private int walletId;

    /**
     */
    @ManyToOne
    private UserDtls userId;

    /**
     */
    @ManyToOne
    private WalletType walletTypeId;

    /**
     */
    private String currency;

    /**
     */
    private BigDecimal balance;

    /**
     */
    private Boolean isActive;

    /**
     */
    private String createdBy;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date createdOn;

    /**
     */
    private String modifiedBy;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date modifiedOn;
}
