class UserRegister {
  final String companyname;
  final String companyemail;
  final String companyaddress;
  final String companymobile;
  final String username;
  final String useremail;
  final String usermobile;
  final String useraddress;
  final String usercountry;
  final String userpassword;

  UserRegister({
    this.companyemail,
    this.companyname,
    this.companyaddress,
    this.companymobile,
    this.username,
    this.useremail,
    this.usermobile,
    this.useraddress,
    this.usercountry,
    this.userpassword,
  });

  factory UserRegister.formJson(Map<String, dynamic> json) {
    return UserRegister(
        companyname: json['company_name'],
        companyemail: json['company_email'],
        companyaddress: json['company_address'],
        companymobile: json['company_mobile'],
        username: json['user_name'],
        useremail: json['user_email'],
        userpassword: json['user_password'],
        useraddress: json['user_password'],
        usercountry: json['user_country'],
        usermobile: json['user_mobile']);
  }
}
