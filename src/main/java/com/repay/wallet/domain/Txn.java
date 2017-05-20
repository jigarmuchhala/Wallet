package com.repay.wallet.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Txn {

    /**
     */
    @ManyToOne
    private UserDtls userId;

    /**
     */
    @ManyToOne
    private Wallet walletId;

    /**
     */
    @ManyToOne
    private TxnType txnTypeId;

    /**
     */
    @NotNull
    @Column(name = "txnId", unique = true)
    private int txnId;

    /**
     */
    private String senderAccountNumber;

    /**
     */
    private String receiverAccountNumber;

    /**
     */
    private String currency;

    /**
     */
    private String details;

    /**
     */
    private BigDecimal txnAmount;

    /**
     */
    private BigDecimal taxValue;

    /**
     */
    private BigDecimal taxAmount;

    /**
     */
    private String taxCurrency;

    /**
     */
    private String status;

    /**
     */
    private String createdBy;

    /**
     */
    private String modifieldBy;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date createdOn;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date modifiedOn;

    /**
     */
    private String comments;
}
