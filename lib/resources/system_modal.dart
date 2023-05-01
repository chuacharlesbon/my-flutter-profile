import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myflutterprofile/resources/constants/colors.dart';
import 'package:myflutterprofile/resources/constants/grid.dart';
import 'package:myflutterprofile/resources/widgets/button.dart';

class CebuanaModal {
  static void showTwoFunctionModal({
    required BuildContext ctx,
    required VoidCallback onSubmit,
    String? onSubmitButtonText,
    String? onCloseButtonText,
    required String modalTitle,
    required String modalSubtitle,
    double? modalWidth,
    double? modalHeight,
  }){
    showDialog(
      context: ctx,
      builder: ((BuildContext _) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(10),
          ),
          child: Container(
            width: modalWidth ?? 450,
            height: modalHeight ?? 165,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: GlobalColors.primaryColor,
                width: 2),
              ),
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                            height: GlobalGrid.medium),
                                                        Text(
                                                          modalTitle,
                                                            style: const TextStyle(
                                                              color:
                                                                  GlobalColors.primaryColor,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                            ),
                                                            textAlign:
                                                                TextAlign.center),
                                                        const SizedBox(
                                                            height: GlobalGrid.medium),
                                                        Text(
                                                            modalSubtitle,
                                                            style: const TextStyle(
                                                              color:
                                                                  GlobalColors.primaryColor,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                            ),
                                                            textAlign:
                                                                TextAlign.center),
                                                        const SizedBox(
                                                            height: GlobalGrid.medium),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                              width: 140,
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal: 2),
                                                              child: MyRawButton(
                                                                  onPressed: () async {
                                                                    Navigator.pop(
                                                                        _, true);
                                                                    onSubmit();
                                                                  },
                                                                  name: onSubmitButtonText ?? "Continue",
                                                                  textColor: GlobalColors
                                                                      .primaryColor,
                                                                  backgroundColor:
                                                                      GlobalColors.bgColor,
                                                                  height: 40,
                                                                  cornerRadius: 40,
                                                                  borderColor:
                                                                      GlobalColors.gray,
                                                                  borderWidth: 1),
                                                            ),
                                                            Container(
                                                              width: 140,
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal: 2),
                                                              child: MyRawButton(
                                                                  onPressed: () async {
                                                                    Navigator.pop(
                                                                        _, true);
                                                                  },
                                                                  name: onCloseButtonText ?? "Cancel",
                                                                  textColor: GlobalColors
                                                                      .primaryColor,
                                                                  backgroundColor:
                                                                      GlobalColors.bgColor,
                                                                  height: 40,
                                                                  cornerRadius: 40,
                                                                  borderColor:
                                                                      GlobalColors.gray,
                                                                  borderWidth: 1),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            height: GlobalGrid.medium),
                                                      ],
                                                    )));
                                          }));
  }

  static void showErrorModal({
    required BuildContext ctx,
    String? message,
    String? title,
    double? modalWidth,
    double? modalHeight,
  }){
    showDialog(
      context: ctx,
      builder: ((BuildContext _) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: modalWidth ?? 450,
          height: modalHeight ?? 165,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: GlobalColors.primaryColor, width: 2),
          ),
          child: Column(
                          children: [
                            const SizedBox(height: GlobalGrid.medium),
                            Text(
                                title ?? "Error",
                                style: const TextStyle(
                                  color: GlobalColors.primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center),
                            const SizedBox(height: GlobalGrid.medium),
                            Text(
                                message ?? "Something went wrong",
                                style: const TextStyle(
                                  color: GlobalColors.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center),
                            const SizedBox(height: GlobalGrid.medium),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 140,
                                    child: MyRawButton(
                                        onPressed: () async {
                                          Navigator.pop(_, true);
                                        },
                                        name: "Ok",
                                        textColor: GlobalColors.primaryColor,
                                        backgroundColor: GlobalColors.bgColor,
                                        height: 40,
                                        cornerRadius: 40,
                                        borderColor: GlobalColors.gray,
                                        borderWidth: 1),
                                  )
                                ]),
                            const SizedBox(height: GlobalGrid.medium),
                          ],
                        )));
    }));
  }

  static void showSuccessFailModal({
    required BuildContext ctx,
    required String toastType,
    required String message,
    double? modalWidth,
    double? modalHeight,
    double? messageFontSize,
    bool? autoClose,
    int? autoCloseTimer
  }){
    showDialog(
      context: ctx,
      builder: ((BuildContext _) {

        void onClose(){
          Navigator.pop(_, true);
        }
        if(autoClose ?? false){
          Future.delayed(Duration(seconds: autoCloseTimer ?? 3), (){           
            onClose();
          });
        }

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: modalWidth ?? 450,
            height: toastType == "error" && !(autoClose ?? false)? (modalHeight ?? 185) : (modalHeight ?? 165),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: GlobalColors.primaryColor, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    toastType == "error"
                      ? Icons.cancel
                      : Icons.check_circle,
                    color: toastType == "error" ? Colors.red : Colors.green,
                    size: 60
                  ),
                  const SizedBox(height: GlobalGrid.medium),
                  Text(
                    message,
                    style: TextStyle(
                      color: GlobalColors.primaryColor,
                      fontSize: messageFontSize ?? 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center
                  ),
                  const SizedBox(height: GlobalGrid.medium),
                  toastType == "error" && !(autoClose ?? false)
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                                  Container(
                                    width: 140,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 2
                                    ),
                                    child: MyRawButton(
                                      onPressed: () async {
                                        Navigator.pop(_, true);
                                      },
                                      name: "OK",
                                      textColor: GlobalColors.primaryColor,
                                      backgroundColor: GlobalColors.bgColor,
                                      height: 40,
                                      cornerRadius: 40,
                                      borderColor: GlobalColors.gray,
                                      borderWidth: 1
                                      ),              
                                    ),
                                  ],
                                )
                                : const SizedBox()
                              ],
                            )
                          )
                        );
    }));
  }

  static void showCustomModal({
    required BuildContext ctx,
    required Widget modalIcon,
    required String modalTitle,
    VoidCallback? onSubmit1,
    VoidCallback? onSubmit2,
    bool? enableTwoFunction,
    String? onSubmitButtonText1,
    String? onSubmitButtonText2,
    String? modalSubtitle,
    double? modalWidth,
    double? modalHeight,
    double? messageFontSize,
  }){
    showDialog(
      context: ctx,
      builder: ((BuildContext _) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: modalWidth ?? 450,
            height: modalHeight ?? 165,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: GlobalColors.primaryColor, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  modalIcon,
                  const SizedBox(height: GlobalGrid.medium),
                  Text(
                    modalTitle,
                    style: const TextStyle(
                      color: GlobalColors.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center
                  ),
                  if(modalSubtitle != null)
                  const SizedBox(height: GlobalGrid.medium),
                  if(modalSubtitle != null)
                  Text(
                    modalSubtitle,
                    style: const TextStyle(
                      color: GlobalColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center
                  ),
                  const SizedBox(height: GlobalGrid.medium),
                  if(enableTwoFunction ?? false != false) 
                  Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                              width: 140,
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal: 2),
                                                              child: MyRawButton(
                                                                  onPressed: () async {
                                                                    Navigator.pop(
                                                                        _, true);
                                                                    onSubmit1!();
                                                                  },
                                                                  name: onSubmitButtonText1 ?? "Continue",
                                                                  textColor: GlobalColors
                                                                      .primaryColor,
                                                                  backgroundColor:
                                                                      GlobalColors.bgColor,
                                                                  height: 40,
                                                                  cornerRadius: 40,
                                                                  borderColor:
                                                                      GlobalColors.gray,
                                                                  borderWidth: 1),
                                                            ),
                                                            Container(
                                                              width: 140,
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal: 2),
                                                              child: MyRawButton(
                                                                  onPressed: () async {
                                                                    Navigator.pop(
                                                                        _, true);
                                                                    onSubmit2!();
                                                                  },
                                                                  name: onSubmitButtonText2 ?? "Cancel",
                                                                  textColor: GlobalColors
                                                                      .primaryColor,
                                                                  backgroundColor:
                                                                      GlobalColors.bgColor,
                                                                  height: 40,
                                                                  cornerRadius: 40,
                                                                  borderColor:
                                                                      GlobalColors.gray,
                                                                  borderWidth: 1),
                                                            ),
                                                          ],
                                                        ),
                              ],
                            )
                          )
                        );
    }));
  }

  static void showSuccessFailToast({
    required BuildContext ctx,
    required String toastType,
    required String message,
    double? modalWidth,
    double? modalHeight,
    double? messageFontSize,
    int? onCloseDuration
  }){
    FToast fToast = FToast();
    fToast.init(ctx);

    Widget toast = Container(
            width: modalWidth ?? 450,
            height: toastType == "error" ? (modalHeight ?? 185) : (modalHeight ?? 165),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: GlobalColors.primaryColor, width: 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    toastType == "error"
                      ? Icons.cancel
                      : Icons.check_circle,
                    color: toastType == "error" ? Colors.red : Colors.green,
                    size: 60
                  ),
                  const SizedBox(height: GlobalGrid.medium),
                  Text(
                    message,
                    style: TextStyle(
                      color: GlobalColors.primaryColor,
                      fontSize: messageFontSize ?? 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center
                  ),
                ],
              )
            );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(seconds: onCloseDuration ?? 3),
    );
  }

  void showToastContainer({
    required BuildContext ctx,
    required Widget child,
    double? modalWidth,
    double? modalHeight,
    int? onCloseDuration,
    BoxDecoration? modalDecoration
  }){
    FToast fToast = FToast();
    fToast.init(ctx);

    Widget toast = Container(
            width: modalWidth,
            height: modalHeight,
            decoration: modalDecoration,
            child: child
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(milliseconds: onCloseDuration ?? 3000),
    );
  }
}