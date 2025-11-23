import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/utils/app_padding.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              flexibleSpace: CustomAppBar(
                title: 'termsAndConditions'.tr,
                notificationIcon: false,
                // lisIcon: false,
              ),
            ),
            SliverPadding(
              padding: AppPadding.horizontalPadding20,
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: AppPadding.verticalPadding20,
                    child: Text(
                      'termsAndConditions'.tr,
                      style: AppTextTheme.primary700(size: 20),
                    ),
                  ),
                  Text(
                    'باستخدامك لتطبيق Active Dear فأنت توافق على الشروط التالية:ـ التطبيق يتيح لك حجز حصص اللياقة والأنشطة الرياضية لدى المراكز والمدربين المسجلين، ويشترط أن يكون عمرك 18 سنة أو أكثر أو أن يكون لديك موافقة من ولي الأمر إذا كنت أصغر. عند التسجيل يجب أن تقدم بيانات صحيحة ودقيقة، وأي استخدام غير صحيح أو إساءة للتطبيق قد يؤدي إلى تعليق أو إلغاء حسابك.ـ الحجز يتم وفق المواعيد المتاحة والدفع يتم عبر الوسائل المعلنة داخل التطبيق، ويحتفظ التطبيق بحق إلغاء أي حجز في حالة وجود خطأ تقني أو مخالفة للشروط. يحق لك إلغاء الحجز قبل مدة محددة يتم إعلانها داخل التطبيق لاسترداد المبلغ أو إعادة الجدولة، أما إذا تم الإلغاء بعد المدة فلا يحق استرجاع المبلغ. قد تختلف سياسة الإلغاء من مركز رياضي لآخر ويلتزم المستخدم بها وقت الحجز. المستخدم يقر أن حالته الصحية تسمح له بممارسة الأنشطة الرياضية، والتطبيق غير مسؤول عن أي إصابات أو مشاكل صحية قد تحدث نتيجة المشاركة في الحصص، لذلك يُنصح باستشارة الطبيب قبل الاشتراك. جميع حقوق الملكية الفكرية الخاصة بالمحتوى والتصميمات والعلامة التجارية لتطبيق Active Dear محفوظة ولا يجوز إعادة استخدامها أو نسخها دون إذن مسبق.'
                        .tr,
                    style: AppTextTheme.primary600(size: 18),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
