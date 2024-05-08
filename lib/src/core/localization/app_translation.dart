import 'package:get/get.dart';

class AppTranslation extends Translations {
  static const Map<String, String> en = {
    /// [Sign in] Page
    "SignInTitle": "Sign In",
    "WelcomeBack": "Welcome Back",
    "LoginFailedErrorText": "Login Failed",
    "RegisterButton": "Register",
    "usermaneLabelText": "Username",
    "PasswordLabelText": "Password",
    "PasswordHintText": "Password",
    "SubmitSignInButton": "Sign in",
    "SubmitSignUpButton": "Sign up",
    "DontHaveAnAccountMessage": "Don't have an account?",
    "resetPasswordMessageAndButton": "Forget your password?",

    /// [Sign up] page
    "nameOfSignUpPage": "Sign up",
    "headTextSignUpPage": "CREATE AN ACCOUNT NOW!",
    "errorMessageSignUpPage": "ooops, Sign up failed",
    "usernameFieldSignUpPage": "Username",
    "passwordFieldSignupPage": "Password",
    "confirmPasswordFieldSignupPage": "Confirm Password",
    "buttonSignUpSignUpPage": "Sign up",
    "buttonSignInSignUpPage": "Sign in",
    "messageHavingAnAccountSignUp": "Do you have an account?",

    /// [Translator Page]
    "nameOfLangEn": "English",
    "nameOfLangAr": "Arabic",
    "nameOfTranslatorPage": "Language",

    /// [HomePage]
    "undoCatchwordDelete": "Undo",
    "PasswordCopied": "Password Copied",
    "homeCategoriesTitle": "Categories",
    "recentlyUsedHome": "Recently Used",
    "addItemHome": "Add item",
    "welcomeMessageHomePage": "Hello, ",
    "lastSuccessfulSignInHomePage": "Last successful login: ",
    "lastUnsuccessfulSignInHomePage": "Last unsuccessful login: ",

    /// [CatchwordView]
    "nameOfCatchwordView": "View Password Card",
    "namePasswordCard": "Name:",
    "accountIdPasswordCard": "Account id",
    "notesPasswordCard": "Notes:",
    "passwordPasswordCard": "Password:",
    "createdAtPasswordCard": "Created at:",
    "assignedCategoryPasswordCard": "Assigned Category:",
    "editPasswordCard": "Edit",
    "deletePasswordCard": "Delete",

    /// [SaveCatchword]
    "WarningPasswordGeneratorSaveCatchword":
        "Please at least check one of features",
    "nameOfSaveCatchwordPage": "Manage Password Info",
    "categoriesTitleSaveCatchword": "Categories: ",
    "selectionCategoryeSaveCatchword": "Select a category",
    "saveButtonSaveCatchword": "Save",
    "discardButtonSaveCatchword": "Discard",
    "nameHintTextSaveCatchword": "Account Name",
    "nameLabelTextSaveCatchword": "Name",
    "emailHintTextSaveCatchword": "Email",
    "passwordHintTextSaveCatchword": "Password",
    "passwordLabelTextSaveCatchword": "Password",
    "notesHintTextSaveCatchword": "Note",
    "notesLabelTextSaveCatchword": "Note",
    "lengthPasswordGeneratorSaveCatchword": "Length",
    "uppercasePasswordGeneratorSaveCatchword": "Uppercase",
    "lowercasePasswordGeneratorSaveCatchword": "Lowercase",
    "symbolsPasswordGeneratorSaveCatchword": "Symbols",
    "numbersPasswordGeneratorSaveCatchword": "Numbers",

    /// [Skeleton]
    "skeletonTitlesHome": "Home",
    "skeletonTitlesVault": "Vault",
    "skeletonTitlesProfile": "Profile",

    /// [Vault]
    "SearchFormVault": "Search for a password..",
    "allWordSelectionVault": "All",

    /// [Manage Category]
    "nameOfManageCategory": "Manage Category",
    "allCategoriesManageCategory": "All Categories",
    "addNewCategoryTitleManageCategory": "Add new category",
    "editNewCategoryTitleManageCategory": "Edit an added category",
    "addButtonManageCategory": "Add",
    "editButtonManageCategory": "Edit",
    "closeButtonManageCategory": "Close",

    /// [Profile]
    "generalInfoProfile": "Personal Information",
    "activityProfile": "Activities Log",
    "aboutProfile": "About",
    "langProfile": "Language",
    "versionProfile": "Version",
    "LogoutProfile": "Logout",

    /// [Formz]
    "passwordInvalidFormz":
        "Password must be at least 8 characters and contain at least one letter and number",
    "passwordEmptyFormz": "Please enter a password",
    "passwordTooShortFormz": "Password must be at least 8 characters",
    "passwordTooLong": "Password must be less than 20 characters",

    /// [Secret]
    "hintLabelSecret": "Secret",
    "selectOneSecurityQuestionSecret": "Please select one security question",
    "securityQuestionOneSecret":
        "What was the name of your elementary/primary school?",
    "securityQuestionTwoSecret": "What was the first concert you attended?",
    "securityQuestionThreeSecret":
        "What was the make and model of your first car?",

    /// [Reset Master Passcode]
    "resetMasterPasscodeTitlePage": "Reset Master Passcode",
    "resetMasterPasscodeButton": "Reset Master Passcode",
    "resetGoToSignInPage": "Try sign in again!",
    "enterNewPasswordResetMasterPasscode": "Enter your new master passcode",

    /// [Onboarding pages]
    "page1Titile": "Welcome to Passwordy!",
    "page1paragraph":
        "Thank you for choosing Passwordy, where your security is our top priority."
            "Get ready to take control of your digital life with our simple,"
            "secure solution to manage all your passwords. We're here to keep "
            "your information safe and accessible only to you.",
    "page2Titile": "Your Security, Our Promise",
    "page2paragraph":
        "Security isn’t just a feature; it’s our foundation. Passwordy uses "
            " advanced encryption standards to protect your data at all times."
            " Learn how our technology ensures that your passwords and personal "
            "information are shielded from unauthorized access.",
    "page3Titile": "Simplify Your Life",
    "page3paragraph":
        "Gone are the days of forgotten passwords and risky notes."
            "Discover how Passwordy can store, and generate your passwords"
            "With just one master password, gain access to"
            " your accounts safely and swiftly.",
    "page4Titile": "Start Your Secure Journey",
    "page4paragraph":
        "All set to explore the world with Passwordy safeguarding your "
            "digital keys? Let’s dive in and start your journey to a safer,"
            "simpler digital life. Securely forward!",
    "onboardingSkip": "Skip", "onboardingDone": "Done",

    /// [Profiles]
    /// [Personal info]
    "persInfoButtonSaveChange": "Save Changes",
    "persInfoButtonSecret": "Secret",
    "persInfoButtonCurrentPass": "Current Password",
    "persInfoButtonNewPass": "New Password",
    "nameOfGeneral": "Personal Information",
    "displayNameGeneral": "Display Name",

    /// [Profiles]
    /// [Activities]
    "activitiesTitlePage": "Activities",
    "activieiesClearAll": "Clear all",
    "delete": "DELETE",
    "hide": "HIDE",
    "show": "SHOW",
    "add": "ADD",
    "edit": "EDIT",

    /// [Profiles]
    /// [About]
    "aboutTitlePage": "About",
    "aboutMessage": "Our password manager app is designed with your security in mind, offering a simple yet robust solution for managing your passwords effortlessly."
        " We utilize the latest encryption technology to ensure that your sensitive information is securely stored and accessible only to you."
        " With features tailored for ease of use, including auto-fill and password generation,"
        " our app aims to streamline your digital life, making it safer and more convenient. "
        "Trust us to keep your credentials secure and organized, so you can focus on what matters most.",
    "aboutVersionLoading": "Version: Loading....",
    "aboutVersionFailed": "Version: -.-.-.-",
    "aboutVersionSuccess": "Version: ",
  };
  static const Map<String, String> ar = {
    /// [Sign in] Page
    "SignInTitle": "تسجيل الدخول",
    "WelcomeBack": "مرحبا بك ",
    "LoginFailedErrorText": "فشل الدخول",
    "RegisterButton": "تسجيل",
    "usermaneLabelText": "اسم المستخدم",
    "PasswordLabelText": "الرمز السري",
    "PasswordHintText": "الرمز السري",
    "SubmitSignInButton": "تسجيل الدخول",
    "SubmitSignUpButton": "انشاء حساب",
    "DontHaveAnAccountMessage": "ليس لديك حساب؟",
    "resetPasswordMessageAndButton": "نسيت كلمة المرور؟",

    /// [Sign up] page
    "nameOfSignUpPage": "انشاء حساب",
    "headTextSignUpPage": "انشأ حسابك الان!",
    "usernameFieldSignUpPage": "اسم المستخدم",
    "errorMessageSignUpPage": "فشل انشاء الحساب",
    "passwordFieldSignupPage": "الرقم السري",
    "confirmPasswordFieldSignupPage": "تاكيد الرقم السري",
    "buttonSignUpSignUpPage": "انشاء الحساب",
    "buttonSignInSignUpPage": "تسجيل الدخول",
    "messageHavingAnAccountSignUp": "هل لديك حساب بالفعل؟",

    /// [Translator Page]
    "nameOfLangEn": "اللغة الانجليزية",
    "nameOfLangAr": "اللغة العربية",
    "nameOfTranslatorPage": "اللغة",

    /// [HomePage]
    "undoCatchwordDelete": "تراجع",
    "PasswordCopied": "تم نسخ الرقم السري",
    "homeCategoriesTitle": "الفئات",
    "recentlyUsedHome": "اضيفت حديثا",
    "addItemHome": "اضافة",
    "welcomeMessageHomePage": "مرحبا, ",
    "lastSuccessfulSignInHomePage": "اخر محاولة تسجيل دخول ناجحة: ",
    "lastUnsuccessfulSignInHomePage": "اخر محاولة تسجيل غير ناجحة: ",

    /// [CatchwordView]
    "nameOfCatchwordView": "عرض معلومات الرقم السري",
    "namePasswordCard": "الاسم: ",
    "accountIdPasswordCard": "اسم المستخدم:",
    "notesPasswordCard": "الملاحظات:",
    "passwordPasswordCard": "الرقم السري:",
    "createdAtPasswordCard": "انشأت بتاريخ:",
    "assignedCategoryPasswordCard": "المجموعة المرتبطة:",
    "editPasswordCard": "تعديل",
    "deletePasswordCard": "حذف",

    /// [Skeleton]
    "skeletonTitlesHome": "الصفحة الرئيسية",
    "skeletonTitlesVault": "الحافظة",
    "skeletonTitlesProfile": "الملف الشخصي",

    /// [Vault]
    "SearchFormVault": "البحث عن رقم سري...",
    "allWordSelectionVault": "الكل",

    /// [SaveCatchword]
    "WarningPasswordGeneratorSaveCatchword": "يرجى اختيار خصائص الرقم السري!",
    "nameOfSaveCatchwordPage": "ادارة معلومات الرقم السري",
    "categoriesTitleSaveCatchword": "الفئات: ",
    "selectionCategoryeSaveCatchword": "اختيار فئة",
    "saveButtonSaveCatchword": "حفظ",
    "discardButtonSaveCatchword": "تجاهل",
    "nameHintTextSaveCatchword": "الاسم",
    "nameLabelTextSaveCatchword": "الاسم",
    "emailHintTextSaveCatchword": "اسم المعرف",
    "passwordHintTextSaveCatchword": "الرقم السري",
    "passwordLabelTextSaveCatchword": "الرقم السري",
    "notesHintTextSaveCatchword": "ملاحظات",
    "notesLabelTextSaveCatchword": "ملاحظات",
    "lengthPasswordGeneratorSaveCatchword": "طول الرقم السري",
    "uppercasePasswordGeneratorSaveCatchword": "احرف كبيرة",
    "lowercasePasswordGeneratorSaveCatchword": "احرف صفيرة",
    "symbolsPasswordGeneratorSaveCatchword": "رموز",
    "numbersPasswordGeneratorSaveCatchword": "ارقام",

    /// [Manage Category]
    "nameOfManageCategory": "ادارة الفئات",
    "allCategoriesManageCategory": "كل الفئات",
    "addNewCategoryTitleManageCategory": "اضافة فئة جديدة",
    "editNewCategoryTitleManageCategory": "تعديل فئة مضافة سابقا",
    "addButtonManageCategory": "اضافة",
    "editButtonManageCategory": "تعديل",
    "closeButtonManageCategory": "اغلاق",

    /// [Profile]
    "generalInfoProfile": "المعلومات الشخصية",
    "activityProfile": "سجل النشاطات",
    "aboutProfile": "حول التطبيق",
    "langProfile": "اللغة",
    "versionProfile": "الاصدار",
    "LogoutProfile": "تسجيل الخروج",

    /// [Formz]
    "passwordInvalidFormz":
        "يرجى ان يكون الرقم السري على الاقل 8 حروف ويحتوي على احرف كبيرة وصغيرة",
    "passwordEmptyFormz": "يرجى ادخال الرقم السري",
    "passwordTooShortFormz":
        "يحب ان يكون الرقم السري مكون من 8 عناصر على الاقل",
    "passwordTooLong": "يجب ان لا يتجاوز الرقم السري 20 عنصر",

    /// [Secret]
    "hintLabelSecret": "جواب السؤال السري",
    "selectOneSecurityQuestionSecret": "يرجى اختيار احد الاسئلة السرية التالية",
    "securityQuestionOneSecret": "ما هو اسم مدرستك الابتدائية؟",
    "securityQuestionTwoSecret": "ما هو اول حفل تمت دعوتك اليه؟",
    "securityQuestionThreeSecret": "ما هو نوع وطراز سيارتك الاولى؟",

    /// [Reset Master Passcode]
    "resetMasterPasscodeTitlePage": "اعادة تعيين كلمة السر",
    "resetMasterPasscodeButton": "اعادة تعيين كلمة السر",
    "resetGoToSignInPage": "تسجيل الدخول!",
    "enterNewPasswordResetMasterPasscode": "ادخل كلمة السر الجديدة",

    /// [Onboarding pages]
    "page1Titile": "مرحبا في باسوردي!",
    "page1paragraph":
        "شكرا لاختياركم باسوردي, حيث امنكم هو اولويتنا القصوى. مع حلنا البسيط والآمن لادارة جميع كلمات المرور الخاصة بكم. نحن هنا للحفاظ على ملعوماتكم آمنة ومتاحة لكم فقط",
    "page2Titile": "معاير التشفير المتقدمة ",
    "page2paragraph":
        "معايير تشفير متقدمة لحماية بياناتك, الامان ليس مجرد ميزة، بل هو اساسنا، تعرف على كيفية ضمان تقنياتنا لحماية كلمات المرور الخاصة بك من الوصول الغير المصرح به",
    "page3Titile": "تسهيل حياتك",
    "page3paragraph":
        "ولت الايام التي كنت تنسى فيها كلمات المرور وتدوين الملاحضات، من خلال باسوردي يمكنك انشاء كلمات المرور الخاصة بك وتخزينها بطريقة آمنة والوصول اليها من خلال كلمة مرور واحدة فقط",
    "page4Titile": "ابدا رحلتك الامنة الان",
    "page4paragraph":
        "هل انت جاهز لنبدأ رحلتك في باسوردي, حياة رقمية آمنة وسهلة!",
    "onboardingSkip": "تجاوز", "onboardingDone": "اكتمل",

    /// [Profiles]
    /// [Personal info]
    "persInfoButtonSaveChange": "حفظ التغيرات",
    "persInfoButtonSecret": "الجواب السري",
    "persInfoButtonCurrentPass": "الرقم السري الحالي",
    "persInfoButtonNewPass": "الرقم السري الجديد",
    "nameOfGeneral": "المعلومات الشخصية",
    "displayNameGeneral": "اسم العرض",

    /// [Profiles]
    /// [Activities]
    "activitiesTitlePage": "سجل النشاطات",
    "activieiesClearAll": "مسح الكل",
    "delete": "حذف",
    "hide": "اخفاء",
    "show": "عرض",
    "add": "اضافة",
    "edit": "تعديل",

    /// [Profiles]
    /// [About]
    "aboutTitlePage": "حول",
    "aboutMessage":
        "تم تصميم تطبيق إدارة كلمات المرور الخاص بنا مع وضع أمنك في الاعتبار، حيث يقدم حلًا بسيطًا ولكنه قوي لإدارة كلمات المرور الخاصة بك بسهولة. نحن نستخدم أحدث تكنولوجيا التشفير لضمان تخزين معلوماتك الحساسة بأمان وجعلها متاحة لك وحدك. مع ميزات مصممة لسهولة الاستخدام، بما في ذلك التعبئة التلقائية وإنشاء كلمة المرور، يهدف تطبيقنا إلى تبسيط حياتك الرقمية، مما يجعلها أكثر أمانًا وراحة. ثق بنا للحفاظ على أمان بيانات اعتمادك وتنظيمها، حتى تتمكن من التركيز على ما هو الأكثر أهمية.",
    "aboutVersionLoading": "الاصدار: تحميل ...",
    "aboutVersionFailed": "الاصدار: -.-.-.",
    "aboutVersionSuccess": "الاصدار: ",
  };

  @override
  Map<String, Map<String, String>> get keys => {"en": en, "ar": ar};
}
