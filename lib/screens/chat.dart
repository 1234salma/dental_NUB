import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
 
  final List<Map<String, String>> faqList = [
    {"question": "ما هي مواعيد العمل في العيادة؟", "answer": "مواعيد العمل في العيادة من الساعة 9 صباحًا حتى 5 مساءً طوال أيام الأسبوع ما عدا الجمعة."},
    {"question": "هل العيادة تعمل في الإجازات الرسمية؟", "answer": "لا، العيادة لا تعمل في الإجازات الرسمية."},
    {"question": "ما هي أنواع العيادات المتاحة؟ (VIP - تعليمية؟)", "answer": "العيادة توفر نوعين من الخدمات: العيادة التعليمية التي يشرف عليها طلاب تحت إشراف أطباء متخصصين، والعيادة VIP التي يديرها أطباء محترفون."},
    {"question": "هل يمكنني اختيار الطبيب المعالج؟", "answer": "لا، يتم توزيع المرضى على الأطباء المتاحين وفقًا لجدول الحجز والتخصص المطلوب."},
    {"question": "ما الفرق بين العيادة التعليمية والعيادة VIP؟", "answer": "الفرق الرئيسي هو أن العيادة التعليمية يتم فيها العلاج على يد طلاب بإشراف الأطباء، بينما العيادة VIP تقدم خدمات مباشرة من الأطباء المتخصصين."},
    {"question": "كيف يمكنني حجز موعد؟", "answer": "يمكنك حجز موعد من خلال التطبيق أو عن طريق موظف الاستقبال في العيادة."},
    {"question": "هل يمكنني تعديل أو إلغاء الحجز؟", "answer": "نعم، يمكنك تعديل أو إلغاء الحجز من خلال التطبيق قبل موعدك بوقت كافٍ."},
    {"question": "كيف أعرف موعدي القادم؟", "answer": "سيتم إرسال رسالة لك على التطبيق تحتوي على تفاصيل موعدك القادم."},
    {"question": "هل يمكنني الحجز بدون استخدام التطبيق؟", "answer": "نعم، يمكنك الحجز عن طريق موظف الاستقبال مباشرة دون الحاجة إلى التطبيق."},
    {"question": "ما هي الإجراءات عند التأخر عن الموعد؟", "answer": "إذا تأخرت عن موعدك، قد يتم إلغاء الحجز تلقائيًا أو تأجيله حسب توفر المواعيد."},
    {"question": "ما هي تكلفة الفحص في العيادة؟", "answer": "تكلفة الفحص تختلف حسب نوع العيادة والخدمة المطلوبة. يمكنك الاطلاع على الأسعار من خلال التطبيق."},
    {"question": "هل يجب الدفع قبل أو بعد الفحص؟", "answer": "يجب الدفع بعد الفحص مباشرة، ويمكنك الدفع نقدًا أو عبر وسائل الدفع الإلكترونية المتاحة."},
    {"question": "ما هي الخدمات التي تقدمها العيادة؟", "answer": "العيادة تقدم مجموعة من الخدمات مثل تنظيف الأسنان، الحشوات، خلع الضروس، وعلاج العصب."},
    {"question": "هل يتم عمل أشعة داخل العيادة؟", "answer": "نعم، العيادة توفر خدمات الأشعة لتشخيص الحالات بدقة."},
    {"question": "كم يستغرق علاج تسوس الأسنان؟", "answer": "مدة علاج تسوس الأسنان تعتمد على حجم التسوس، ولكن عادةً لا يستغرق أكثر من 30-60 دقيقة."},
    {"question": "ما هو أفضل علاج لحساسية الأسنان؟", "answer": "يمكنك استخدام معجون أسنان مخصص للحساسية واستشارة الطبيب لمعرفة العلاج المناسب."},
    {"question": "متى أحتاج إلى خلع ضرس العقل؟", "answer": "يتم خلع ضرس العقل عند وجود ألم شديد أو تأثيره على الأسنان المجاورة، ويتم تحديد ذلك من قبل الطبيب بعد الفحص."},
    {"question": "كيف يمكنني إنشاء حساب في التطبيق؟", "answer": "يمكنك إنشاء حساب في التطبيق من خلال إدخال بياناتك الأساسية مثل الاسم، رقم الهاتف، وكلمة المرور."},
    {"question": "نسيت كلمة المرور، كيف يمكنني استعادتها؟", "answer": "يمكنك استعادة كلمة المرور عبر خيار \"نسيت كلمة المرور\" في التطبيق وإدخال رقم هاتفك أو بريدك الإلكتروني."},
    {"question": "هل يمكنني التواصل مع الطبيب من خلال التطبيق؟", "answer": "لا يمكنك إرسال استفسارات للطبيب عبر التطبيق"},
  ];

  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1F5382)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'static chat',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F5382),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: faqList.length,
        itemBuilder: (context, index) {
          final item = faqList[index];
          final isExpanded = expandedIndex == index;

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: InkWell(
              onTap: () {
                setState(() {
                  expandedIndex = isExpanded ? null : index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item["question"]!,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    ),
                    if (isExpanded) ...[
                      const SizedBox(height: 12),
                      Text(
                        item["answer"]!,
                        style: const TextStyle(fontSize: 15, color: Colors.black87),
                        textAlign: TextAlign.right,
                      ),
                    ]
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}