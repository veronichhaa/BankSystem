package myApp.controller;

import myApp.dao.*;
import myApp.model.*;
import myApp.service.SecurityService;
import myApp.service.SecurityServiceImpl;
import myApp.service.UserService;
import myApp.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Calendar;
import java.util.Set;


@Controller
public class UserController {

    @Autowired
    private CreditDao creditDao;

    @Autowired
    private DepositDao depositDao;

    @Autowired
    private CardDao cardDao;

    @Autowired
    private AccountDao accountDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    SecurityServiceImpl securityServiceImpl;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private PersonDao personDao;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autoLogin(userForm.getUsername(), userForm.getConfirmPassword());

        return "redirect:/welcome";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null) {
            model.addAttribute("error", "Username or password is incorrect.");
        }
        if (logout != null) {
            model.addAttribute("message", "Logged out successfully.");
        }
        return "login";
    }

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        String username = securityServiceImpl.findUsername();
        User info = userService.findByUsername(username);
        model.addAttribute("info", info);
        Person person = personDao.findByUsername(username);
        model.addAttribute("person", person);
        return "welcome";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(Model model) {
        User info = userService.findByUsername(securityServiceImpl.findUsername());
        model.addAttribute("info", info);
        Iterable<Person> person_info = personDao.findAll();
        model.addAttribute("person_info", person_info);
        Iterable<Account> account_info = accountDao.findAll();
        model.addAttribute("account_info", account_info);
        Iterable<Card> card_info = cardDao.findAll();
        model.addAttribute("card_info", card_info);
        Iterable<Deposit> deposit = depositDao.findAll();
        model.addAttribute("deposit", deposit);
        Iterable<Credit> credit = creditDao.findAll();
        model.addAttribute("credit", credit);
        return "admin";
    }

    @RequestMapping(value = {"/clients/{id}"}, method = RequestMethod.GET)
    public String clients(Model model, @PathVariable("id") Long id) {
        Person person = personDao.findById(id);
        model.addAttribute("person", person);
        String username = person.getUsername();
        Account account = accountDao.findByUsername(username);
        model.addAttribute("account", account);
        Card card = cardDao.findByUsername(username);
        model.addAttribute("card", card);
        Iterable<Deposit> deposit = depositDao.findAllByUsername(username);
        model.addAttribute("deposit", deposit);
        Iterable<Credit> credit = creditDao.findAllByUsername(username);
        model.addAttribute("credit", credit);
        return "clients";
    }

    @RequestMapping(value = {"/clients/{id}"}, method = RequestMethod.POST)
    public String clients(Model model, @PathVariable("id") Long id, @ModelAttribute("personalForm") Person personalForm) {
        Person person = personDao.findById(id);
        String username = person.getUsername();
        if(person==null){
            Person person1 = new Person(username, personalForm.getName(), personalForm.getSurname(), personalForm.getPas_ser(), personalForm.getPass_num(), personalForm.getAddress(), personalForm.getBirthdate(), personalForm.getPhone());
            personDao.save(person1);
        }
        else{
            person.setUsername(username);
            person.setName(personalForm.getName());
            person.setSurname(personalForm.getSurname());
            person.setPas_ser(personalForm.getPas_ser());
            person.setPass_num(personalForm.getPass_num());
            person.setAddress(personalForm.getAddress());
            person.setBirthdate(personalForm.getBirthdate());
            person.setPhone(personalForm.getPhone());
            personDao.save(person);
        }
        return "redirect:/admin";
    }


    @RequestMapping(value = {"/personalRoom"}, method = RequestMethod.GET)
    public String personalRoom(Model model) {
        String username = securityServiceImpl.findUsername();
        User info = userService.findByUsername(username);
        model.addAttribute("info", info);
        Person person = personDao.findByUsername(username);
        model.addAttribute("person", person);
        Account account = accountDao.findByUsername(username);
        model.addAttribute("account", account);
        Card card = cardDao.findByUsername(username);
        model.addAttribute("card", card);
        Iterable<Deposit> deposit = depositDao.findAllByUsername(username);
        model.addAttribute("deposit", deposit);
        Iterable<Credit> credit = creditDao.findAllByUsername(username);
        model.addAttribute("credit", credit);
        return "personalRoom";
    }

    @RequestMapping(value = "/personalRoom/edit", method = RequestMethod.GET)
    public String personalRoomEdit(Model model) {
        String username = securityServiceImpl.findUsername();
        Person person = personDao.findByUsername(username);
        model.addAttribute("person", person);
        return "personalRoom-edit";
    }

    @RequestMapping(value = "/personalRoom/edit", method = RequestMethod.POST)
    public String personalRoomEdit(@ModelAttribute("personalForm") Person personalForm, Model model) {
        String username = securityServiceImpl.findUsername();
        Person person = personDao.findByUsername(username);
        if(person==null){
            Person person1 = new Person(username, personalForm.getName(), personalForm.getSurname(), personalForm.getPas_ser(), personalForm.getPass_num(), personalForm.getAddress(), personalForm.getBirthdate(), personalForm.getPhone());
            personDao.save(person1);
        }
        else{
            person.setUsername(username);
            person.setName(personalForm.getName());
            person.setSurname(personalForm.getSurname());
            person.setPas_ser(personalForm.getPas_ser());
            person.setPass_num(personalForm.getPass_num());
            person.setAddress(personalForm.getAddress());
            person.setBirthdate(personalForm.getBirthdate());
            person.setPhone(personalForm.getPhone());
            personDao.save(person);
        }

        return "redirect:/personalRoom";
    }

    @RequestMapping(value = "/credit", method = RequestMethod.GET)
    public String credit(Model model) {
        String username = securityServiceImpl.findUsername();
        Iterable<Credit> credit = creditDao.findAllByUsername(username);
        model.addAttribute("credit", credit);
        return "credit";
    }

    @RequestMapping(value = "/credit", method = RequestMethod.POST)
    public String credit(@ModelAttribute("creditForm") Credit creditForm, Model model) {
        String username = securityServiceImpl.findUsername();
        Credit credit = new Credit();
        credit.setUsername(username);
        credit.setSum(creditForm.getSum());
        credit.setTerm(creditForm.getTerm());
        credit.setStart("2022-05-10");
        credit.setPercent(9.5f);
        float payments = (creditForm.getSum()*0.095f+creditForm.getSum())/creditForm.getTerm();
        credit.setPayments(payments);
        creditDao.save(credit);
        return "redirect:/credit";
    }

    @RequestMapping(value = "/deposit", method = RequestMethod.GET)
    public String deposit(Model model) {
        String username = securityServiceImpl.findUsername();
        Iterable<Deposit> deposit = depositDao.findAllByUsername(username);
        model.addAttribute("deposit", deposit);
        return "deposit";
    }

    @RequestMapping(value = "/deposit", method = RequestMethod.POST)
    public String deposit(@ModelAttribute("depositForm") Deposit depositForm, Model model) {
        String username = securityServiceImpl.findUsername();
        Deposit deposit = new Deposit();
        deposit.setUsername(username);
        deposit.setSum(depositForm.getSum());
        deposit.setTerm(depositForm.getTerm());
        deposit.setStart("2022-05-10");
        deposit.setPercent(9f);
        float profit = deposit.getSum()*0.095f*depositForm.getTerm()/12;
        deposit.setProfit(profit);
        depositDao.save(deposit);
        return "redirect:/deposit";
    }
}
