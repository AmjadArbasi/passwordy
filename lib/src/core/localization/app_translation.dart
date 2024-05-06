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

    /// [General]
    "nameOfGeneral": "Personal Information",
    "displayNameGeneral": "Display Name",

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
    "enterNewPasswordResetMasterPasscode": "ادخل كلمة السر الجديدة"
  };

  @override
  Map<String, Map<String, String>> get keys => {"en": en, "ar": ar};
}
