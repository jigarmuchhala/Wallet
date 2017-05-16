package com.repay.wallet.domain;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/txntypes")
@Controller
@RooWebScaffold(path = "txntypes", formBackingObject = TxnType.class)
public class TxnTypeController {
}
