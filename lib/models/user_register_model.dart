class UserRegister {
  final String company_name;
  final String company_email;
  final String company_address;
  final String company_mobile;

  final String user_name;
  final String user_email;
  final String user_mobile;
  final String user_address;
  final String user_country;
  final String user_password;

  UserRegister({
    this.company_email,
    this.company_name,
    this.company_address,
    this.company_mobile,
    this.user_name,
    this.user_email,
    this.user_mobile,
    this.user_address,
    this.user_country,
    this.user_password,
  });

  factory UserRegister.formJson(Map<String, dynamic> json) {
    return UserRegister(
        company_name: json['company_name'],
        company_email: json['company_email'],
        company_address: json['company_address'],
        company_mobile: json['company_mobile'],
        user_name: json['user_name'],
        user_email: json['user_email'],
        user_password: json['user_password'],
        user_address: json['user_password'],
        user_country: json['user_country'],
        user_mobile: json['user_mobile']);
  }
}
