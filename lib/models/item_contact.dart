enum ItemContact { phone, email,github }


extension ExtensionItemContact on ItemContact {

    String get value {
    switch (this) {
    
      case ItemContact.phone:
          return "+54 9 376 512-9412 ";
      case ItemContact.email:
        return "denis@guazuapp.com";
      case ItemContact.github:
        return "https://github.com/bueltan";
    }
  }
      String get icon {
    switch (this) {
      case ItemContact.phone:
          return "/icons/phone.svg";
      case ItemContact.email:
        return "/icons/email.svg";
      case ItemContact.github:
        return "/icons/github.svg";
    }
  }

    String get nameKey {
    switch (this) {
      case ItemContact.phone:
          return "phone";
      case ItemContact.email:
        return "email";
      case ItemContact.github:
        return "github";
    }
  }


} 