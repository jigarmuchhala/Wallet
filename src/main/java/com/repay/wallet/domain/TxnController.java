package com.repay.wallet.domain;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/txns")
@Controller
@RooWebScaffold(path = "txns", formBackingObject = Txn.class)
public class TxnController {
}
