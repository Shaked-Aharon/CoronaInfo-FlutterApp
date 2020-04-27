// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class QandAWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (var i = 0; i < data.length; i++) {
      children.add(EntryItem(data[i]));
    }

    return Card(
      margin: EdgeInsets.only(bottom: 10.0, top: 5.0),
      elevation: 3.0,
      child: Column(mainAxisSize: MainAxisSize.min, children: children),
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'האם מותר לצאת מהבית?',
    <Entry>[
      Entry(
          'לא ניתן לצאת מהבית (ממקום מגורים או ממקום שהייה קבוע) למרחב הציבורי אלא לאחת המטרות המצויינות מטה.'),
    ],
  ),
  Entry(
    'באילו מקרים ניתן לצאת מהבית?',
    <Entry>[
      Entry('- הגעה וחזרה ממקום עבודה המותר על פי התקנות.'),
      Entry('- הצטיידות במזון, תרופות, מוצרים חיוניים וקבלת שירותים חיוניים.'),
      Entry('- קבלת שירות רפואי'),
      Entry('- תרומת דם'),
      Entry('- קבלת טיפול במסגרות רווחה'),
      Entry(
          '- סיוע רפואי לאדם אחר או סיוע לאדם עם קושי או מצוקה הדורשים סיוע.'),
      Entry('- תפילה במקום פתוח בלבד (עד 10 אנשים במרחק 2 מטר אחד מהשני).'),
      Entry(
          '- הלוויה, חתונה או ברית במקום פתוח בלבד (עד 20 אנשים במרחק 2 מטר אחד מהשני).'),
      Entry('- יציאת אישה לטבילה במקווה נשים ובלבד שתיאמה מראש את מועד הגעתה.'),
      Entry(
          '- העברה של קטין למסגרות חינוך לילדי עובדים חיוניים ומסגרות מיוחדות (בהתאם לפקודת צו בריאות העם).'),
      Entry(
          '- יציאה של יחיד או של אנשים הגרים באותו מקום, לזמן קצר ובמרחק של עד 100 מטרים ממקום המגורים.'),
      Entry(
          '- העברה של קטין שהוריו חיים בנפרד, על ידי אחד מהוריו, לביתו של ההורה השני.'),
      Entry(
          '- העברה של קטין שההורה האחראי עליו נדרש לצאת לצורך חיוני ואין במקום המגורים אחראי שניתן להשאיר את הקטין בהשגחתו.'),
      Entry('- הליך משפטי.'),
      Entry('- הפגנה.'),
      Entry('- הגעה לכנסת.'),
    ],
  ),
  Entry(
    'אילו מקומות עבודה ימשיכו לעבוד?',
    <Entry>[
      Entry('- שירותים חיוניים'),
      Entry('- מקומות עבודה עד 10 עובדים: בתנאי שישמרו על מרחק.'),
      Entry(
          '- מקומות עבודה מעל 10 עובדים: עד 30 אחוזים מהעובדים, לפי החלטת ההנהלה.'),
    ],
  ),
  Entry(
    'אילו חנויות יישארו פתוחות ?',
    <Entry>[
      Entry('- שירותי משלוחים למזון.'),
      Entry('- עיתונים.'),
      Entry(
          '- שירותים חיוניים לתחזוקת הבית, מוצרי חשמל, מוצרי ושירותי תקשורת ואביזרים רפואיים.'),
      Entry('- מכירה מקוונת עם משלוח של כל סוגי המוצרים.'),
      Entry(
          '- בשירות משלוחים למקום מגורים, המשלוח יונח מחוץ לפתח בית המגורים.'),
      Entry(
          '- עסקים שיפעלו תוך שמירה על מרחק של 2 מטרים בין אנשים ומניעת צפיפות כך שבכל עת לא ישהו בתוך החנות יותר מ-4 לקוחות לכל קופה פעילה.'),
      Entry('- עסקים למכירת מזון לצריכה מחוץ לבית האוכל ובשירות משלוחים בלבד'),
      Entry('- בתי מרקחת'),
      Entry('- מכוני אופטיקה'),
      Entry('- חנויות שעיקר עיסוקן מכירת מוצרי היגיינה'),
    ],
  ),
  Entry(
    'האם ניתן להשתמש בשירותי בריאות?',
    <Entry>[
      Entry(
          '- במידה ויש בעיה בריאותית מומלץ לצרוך שרותי רפואה מרחוק ולא להגיע פיזית למרפאה, ככל שהדבר מתאפשר ובהתאם להנחיות קופת החולים באינטרנט ובתקשורת.'),
      Entry(
          '- יש לבסס את אפיקי התקשורת עם קופת החולים. יש לבדוק באינטרנט או באמצעות בני משפחה מהן הנחיות הקופה במידה ותזדקקו לשרות רפואי (עליכם לוודא שאתם יודעים איך ליצור קשר עם הקופה ולעקוב אחרי הנחיות קופת החולים).'),
      Entry(
          '- אם מרגישים שמתפתחת מחלה, חום, עם או בלי תסמינים נשימתיים, יש להיכנס לבידוד בית ומניעת מגע עם בני המשפחה. יש למדוד חום פעמיים ביום. במידה ומודאגים – יש ליצור קשר עם הרופא או עם מרכז הפניות של קופת החולים.'),
      Entry(
          '- במקרה של מחלת חום, על החולים להימצא בבידוד עד יומיים לאחר סיום החום. שאר בני המשפחה יהיו בבידוד רק במקרה של אבחנה של נגיף קורונה.'),
      Entry(
          '- טיפולי שיניים מומלץ לדחות ולבצע רק במצבים הכרחיים ובמצבי חירום.'),
      Entry(
          '- לצוותי בריאות המטפלים בחולים ניתן להתכנס רק למטרות עבודה ובקבוצות שלא יעלו על 10 אנשים.'),
      Entry('- הופסקה הפעילות האלקטיבית בבתי החולים הציבוריים.'),
    ],
  ),
  Entry(
    'האם צפויה אכיפה?',
    <Entry>[
      Entry(
          'על חנויות ועסקים שיפתחו בניגוד להנחיות יוטלו סנקציות שינועו בין קנס מנהלי שגובהו עדיין לא נקבע ועד לרישום פלילי. על פי ההנחיות, ניתן יהיה להטיל קנס כספי של 500 שקלים גם על יחידים שיפרו את ההגבלות אך המשטרה תנסה להימנע מכך ובשלב הראשון יסתפקו באזהרה בלבד.'),
      Entry('- הפרת ההנחיות החדשות - יחיד 500 שקלים.'),
      Entry('- הפרת חובה של בעל עסק - 5000 שקלים.'),
      Entry('- הפעלת שירות תח״צ בניגוד להחיות - 5000 שקלים .'),
      Entry('- מפר בידוד - 5000 שקלים.'),
      Entry('- התקהלות - 3000 שקלים.'),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Center(
        child: Text(
          root.title,
          style: TextStyle(
              fontSize: 12.8, letterSpacing: 1, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
