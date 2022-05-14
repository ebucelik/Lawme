//
//  MoreView.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 14.05.22.
//

import SwiftUI

struct MoreView: View {

    let more: More

    var getMoreText: String {
        switch more {
        case .ContactAndImpressum:
            return """
LawMe GmbH
Stephansplatz 1/2/22, 1010 Wien
Telefon: Tel. +43 664 79 52 151
E-Mail: office@lawme.com
UID: ATX 11 11 11 22
Firmenbuchnummer: 11111d
Firmenbuchgericht: Handelsgericht Wien
Behörde gem. ECG: Magistrat Wien 2412
GLN (der öffentlichen Verwaltung): 9110021059114
DVR 347489502

Für sämtliche Inhalte verantwortlich: LawMe GmbH
Stephansplatz 1/2/22, 1010 Wien

Grafik, Layout und Programmierung: LawMe GmbH
Stephansplatz 1/2/22, 1010 Wien
"""
        case .General:
            return """
Grundlegende Richtung
Die Website beinhaltet unpolitische Informationen über Angebot, Produkte und Leistungen des Unternehmens und richtet sich vorwiegend an Kunden und Interessenten.
Haftungsausschluss / § 5 ECG
Der Autor dieser Webseiten ist bestrebt, die hier angebotenen Informationen nach bestem Wissen und Gewissen vollständig und richtig darzustellen und aktuell zu halten. Dennoch kann er keinerlei Haftung für Schäden übernehmen, die sich aus der Nutzung der angebotenen Informationen ergeben können – auch wenn diese auf die Nutzung von allenfalls unvollständigen bzw. fehlerhaften Informationen zurückzuführen sind.
Verweise auf fremde Webseiten liegen außerhalb des Verantwortungsbereiches des Autors. Eine Haftung für die Inhalte von verlinkten Seiten ist ausgeschlossen, zumal der Autor keinen Einfluss auf Inhalte wie Gestaltung von gelinkten Seiten hat. Für Inhalte von Seiten, auf welche von Seiten dieser Webseiten verwiesen wird, haftet somit allein der Anbieter dieser fremden Webseiten – niemals jedoch derjenige, der durch einen Link auf fremde Publikationen und Inhalte verweist. Sollten gelinkte Seiten (insbesondere durch Veränderung der Inhalte nach dem Setzen des Links) illegale, fehlerhafte, unvollständige, beleidigende oder sittenwidrige Informationen beinhalten und wird der Autor dieser Seite auf derartige Inhalte von gelinkten Seiten aufmerksam (gemacht), so wird er einen Link auf derartige Seiten unverzüglich unterbinden.
Haftung für Links auf Websites Dritter
Unser Angebot enthält unter Umständen Links zu externen Websites. Auf den Inhalt dieser externen Websites haben wir keinerlei Einfluss. Deshalb können wir für diese fremden Inhalte auch keine Gewähr übernehmen. Für die Inhalte der verlinkten Seiten ist stets der jeweilige Anbieter oder Betreiber der Seiten verantwortlich. Die verlinkten Seiten wurden zum Zeitpunkt der Verlinkung auf mögliche Rechtsverstöße überprüft. Rechtswidrige Inhalte waren zum Zeitpunkt der Verlinkung nicht erkennbar. Eine permanente inhaltliche Kontrolle der verlinkten Seiten ist jedoch ohne konkrete Anhaltspunkte einer Rechtsverletzung nicht zumutbar. Bei Bekanntwerden von Rechtsverletzungen werden wir derartige Links umgehend entfernen.
Urheberrecht
Die vom Autor selbst erstellten Inhalte (Texte und Bilder) dieser Seiten sind urheberrechtlich geschützt. Die Informationen sind nur für die persönliche Verwendung bestimmt. Jede den Bestimmungen des Urheberrechtsgesetzes widersprechende Verwendung jeglicher Inhalte dieser Webseiten – insbesondere die weitergehende Nutzung wie beispielsweise die Veröffentlichung, Vervielfältigung und jede Form von gewerblicher Nutzung sowie die Weitergabe an Dritte – auch in Teilen oder in überarbeiteter Form – ohne ausdrückliche Zustimmung des Autors ist untersagt.
Informationsinhalt
Die Informationen dieser Webseiten können ohne vorherige Ankündigung geändert, entfernt oder ergänzt werden. Der Autor kann daher keine Garantie für die Korrektheit, Vollständigkeit, Qualität oder Aktualität der bereitgestellten Informationen geben.
Rechtswirksamkeit
Durch Nutzung dieser Webseiten unterliegt der Nutzer den gegenständlichen Nutzungsbedingungen. Diese sind Teil des WWW-Angebotes. Sofern Teile oder einzelne Formulierungen der Nutzungsbedingungen der geltenden Rechtslage nicht, nicht mehr oder nicht vollständig entsprechen sollten, bleiben die übrigen Teile der Nutzungsbedingungen in ihrem Inhalt und ihrer Gültigkeit davon unberührt.
Datenschutzerklärung
In unserer Datenschutzerklärung wird erläutert, welche Informationen wir erheben, aus welchem Grund und wie wir diese Informationen nutzen.
Von uns erhobene Informationen
Wir erheben Informationen, die Sie uns ausdrücklich geben oder uns erlauben zu ermitteln.
Persönliche Daten
Persönliche Daten, die Sie auf dieser Website elektronisch übermitteln, wie zum Beispiel Name, E-Mail-Adresse, Adresse oder andere persönlichen Angaben, werden von uns nur zum jeweils angegebenen Zweck verwendet, sicher verwahrt und nicht an Dritte weitergegeben.
Der Provider erhebt und speichert automatisch Informationen am Webserver wie verwendeter Browser, Betriebssystem, Verweisseite, IP-Adresse, Uhrzeit des Zugriffs usw. Diese Daten können ohne Prüfung weiterer Datenquellen keinen bestimmten Personen zugeordnet werden und wir werten diese Daten auch nicht weiter aus solange keine rechtswidrige Nutzung unserer Website vorliegt.
Kontaktformulare
Im Rahmen der anzugebenden Daten im Rahmen der Kontaktformulare speichern wir Ihren Namen und Ihre postalische sowie Ihre E-Mail-Adresse bis zur vollständigen Bearbeitung Ihrer Anfrage. Für andere Zwecke als für Ihre Anfrage verwenden wir Ihre Daten nicht. Mit Absenden Ihrer Angaben im Rahmen der Kontaktformulare erteilen Sie Ihre Zustimmung zur Speicherung und Verarbeitung Ihres Namens und Ihrer postalischen sowie Ihrer E-Mail-Adresse zum Zweck der vollständigen Bearbeitung Ihrer Anfrage.
Wir weisen darauf hin, dass die Datenübertragung im Internet (z.B. bei der Kommunikation per E-Mail) Sicherheitslücken aufweisen kann. Ein lückenloser Schutz der Daten vor einem Zugriff durch Dritte ist nicht möglich.
Auskunftsrecht
Auf Ihr Verlangen teilen wir Ihnen gerne kostenlos mit, ob und welche personenbezogenen Daten zu Ihrer Person gespeichert sind sowie verarbeitet werden. Unrichtige Daten werden von uns nach Kenntnis berichtigt.
Ansprechpartner
Sämtliche Anfragen, Erklärungen und Rückfragen zur Datennutzung richten Sie bitte an datenschutz@lawme.com.
Recht auf Widerruf
Sie haben das Recht auf Widerruf der Nutzung Ihrer personenbezogenen Daten. Schicken Sie bitte eine E-Mail an datenschutz@lawme.com, wir werden Ihre Daten dann umgehend löschen.
Cookies
Um Ihnen auf unserer Internetseite bestimmte Funktionen bieten zu können, verwenden wir sogenannte Cookies. Dies sind kleine Textdateien, die auf Ihrem Computer für die Dauer einer Browser-Sitzung gespeichert werden. Nach dem Ende der Browser-Sitzung werden die von uns verwendeten Cookies wieder gelöscht. Sie haben die Möglichkeit, die Installation von Cookies auf Ihrem Computer zu verhindern, indem Sie die Browsereinstellungen verändern; wir weisen Sie jedoch daraufhin, dass dadurch die Funktionen unserer Internetseite gegebenenfalls nicht mehr vollumfänglich genutzt werden können.
Google Analytics: Datenschutz und Widerspruchsmöglichkeit
Diese Website benutzt Google Analytics, einen Webanalysedienst der Google Inc. („Google“). Google Analytics verwendet sog. „Cookies“, Textdateien, die auf Ihrem Computer gespeichert werden und die eine Analyse der Benutzung der Website durch Sie ermöglichen. Die durch den Cookie erzeugten Informationen über Ihre Benutzung dieser Website werden in der Regel an einen Server von Google in den USA übertragen und dort gespeichert. Im Falle der Aktivierung der IP-Anonymisierung auf dieser Webseite, wird Ihre IP-Adresse von Google jedoch innerhalb von Mitgliedstaaten der Europäischen Union oder in anderen Vertragsstaaten des Abkommens über den Europäischen Wirtschaftsraum zuvor gekürzt. Nur in Ausnahmefällen wird die volle IP-Adresse an einen Server von Google in den USA übertragen und dort gekürzt. Im Auftrag des Betreibers dieser Website wird Google diese Informationen benutzen, um Ihre Nutzung der Website auszuwerten, um Reports über die Websiteaktivitäten zusammenzustellen und um weitere mit der Websitenutzung und der Internetnutzung verbundene Dienstleistungen gegenüber dem Websitebetreiber zu erbringen. Die im Rahmen von Google Analytics von Ihrem Browser übermittelte IP-Adresse wird nicht mit anderen Daten von Google zusammengeführt. Sie können die Speicherung der Cookies durch eine entsprechende Einstellung Ihrer Browser-Software verhindern; wir weisen Sie jedoch darauf hin, dass Sie in diesem Fall gegebenenfalls nicht sämtliche Funktionen dieser Website vollumfänglich werden nutzen können. Sie können darüber hinaus die Erfassung der durch das Cookie erzeugten und auf Ihre Nutzung der Website bezogenen Daten (inkl. Ihrer IP-Adresse) an Google sowie die Verarbeitung dieser Daten durch Google verhindern, indem sie das unter dem folgenden Link verfügbare Browser-Plugin herunterladen und installieren: Browser-Add-on zur Deaktivierung von Google Analytics
Allgemeine Informationen zu Google Analytics und Datenschutz finden Sie im Datenschutz-Center von Google. Diese Website wurde um die Funktion 'anonymizeIp' erweitert um eine anonymisierte Erfassung von IP-Adressen (sog. IP-Masking) zu gewährleisten.
Sie können die Erfassung durch Google Analytics verhindern, indem Sie auf folgende Verknüpfung klicken. Es wird ein Opt-Out-Cookie gesetzt, das die zukünftige Erfassung Ihrer Daten beim Besuch dieser Website verhindert, solange das Cookie nicht gelöscht wird: Google Analytics deaktivieren.
"""
        case .PrivacyPolicy:
            return """
Datenschutzhinweis (Stand: Mai 2022)
Gerade als Dienstleister im Rechtsbereich ist uns der Datenschutz ein hohes Anliegen. Wir sind uns bewusst, dass die personenbezogenen Daten unserer Mitarbeiter und unserer Kunden ein hohes Gut darstellen und einen hohen Stellenwert in unserem Unternehmen einnehmen müssen. Und dabei steht der
Schutz dieser Daten vor Missbrauch und Verlust an erster Stelle.
Das sind wir: Firmenwortlaut LawMe GmbH
Firmensitz Stephansplatz 1/2/22, 1010 Wien
Österreich
Kontaktdaten Telefon: Tel. +43 664 79 52 151
E-Mail: office@lawme.com
UID: ATX 11 11 11 22
Firmenbuchnummer: 11111d
Firmenbuchgericht: Handelsgericht Wien

Wir sind der für die Verarbeitung Ihrer Daten Verantwortliche. Sollten Sie Anliegen oder Fragen
zur Verarbeitung Ihrer Daten durch unser Unternehmen haben, ersuchen wir Sie uns unter
datenschutz@lawme.at
zu kontaktieren.

Die Verarbeitung Ihrer Daten
Wir verarbeiten nur Daten, die Sie uns selbst und freiwillig zur Verfügung gestellt haben. Alle verwendeten Daten werden nur zur Erfüllung eines Vertrages und zur Erfüllung rechtlicher Verpflichtungen verarbeitet (Prinzipien „Rechtmäßigkeit, Verarbeitung nach Treu und Glauben, Transparenz“ und „Zweckbindung“). Auf keinen Fall werden Ihre Daten irgendeiner Art von Profiling unterworfen oder zu anderen Zwecken verwendet, als Sie zugestimmt haben. Es werden nur Daten gespeichert, die für Zwecke der Verarbeitung angemessen sind (Prinzip der „Datenminimierung“) und wir versuchen, diese Daten sachlich und inhaltlich aktuell und richtig zu halten (Prinzip der „Richtigkeit“).

Wir behalten Ihre Daten so lange, wie wir mit Ihnen in einer geschäftlichen Beziehung stehen.
Darüber hinaus verwahren wir Ihre Daten nur mehr um etwaigen rechtlichen
Aufbewahrungspflichten oder sonstigen Ansprüchen gerecht werden zu können (Prinzip der „Speicherbegrenzung“).
Eine Weitergabe von Daten an externe Firmen erfolgt nur in folgenden Fällen:
- Externe Auftragsverarbeiter werden herangezogen, wenn wir die benötigten Tätigkeiten
aaufgrund deren Komplexität nicht selbst durchführen können oder wollen
- Eine Weitergabe an Behörden oder Gerichte erfolgt nur auf Antrag dieser Institutionen
In all diesen Fällen achten wir jedoch stets darauf, dass die gesetzlichen Grundlagen eingehalten
werden und damit der Schutz der personenbezogenen Daten gewahrt bleibt.
Unsere Datensicherheit
All Ihre Daten werden in einer Weise verarbeitet, die eine angemessene Sicherheit der
personenbezogenen Daten gewährleistet. Darin verstehen wir auch den Schutz vor unbefugter
oder unrechtmäßiger Verarbeitung, aber auch vor unbeabsichtigtem Verlust, Zerstörung oder
Schädigung (Prinzip der „Integrität und Vertraulichkeit“).
Durch geeignete organisatorische und technische Maßnahmen auf unserer Seite sind Ihre Daten
bei uns in Sicherheit.
Ihre Rechte
Sie können Auskunft zur Herkunft, zu den Kategorien, zur Speicherdauer, zu den Empfängern, zum Zweck der zu Ihrer Person und zu Ihrem Geschäftsfall von uns verarbeiteten Daten und zur Art
dieser Verarbeitung verlangen.
Falls wir Daten zu Ihrer Person verarbeiten, die unrichtig oder unvollständig sind, so können Sie deren Berichtigung oder Vervollständigung verlangen. Sie können auch die Löschung unrechtmäßig verarbeiteter Daten verlangen. Bitte beachten Sie aber, dass dies nur auf unrichtige, unvollständige oder unrechtmäßig verarbeitete Daten zutrifft. Ist unklar, ob die zu Ihrer Person verarbeiteten Daten unrichtig oder unvollständig sind oder unrechtmäßig verarbeitet werden, so können Sie die Einschränkung der Verarbeitung Ihrer Daten bis zur endgültigen Klärung dieser Frage verlangen. Wir ersuchen Sie zu beachten, dass diese Rechte einander ergänzen, sodass Sie nur entweder die Berichtigung bzw. Vervollständigung Ihrer Daten oder deren Löschung verlangen können.
Auch wenn die Daten zu Ihrer Person richtig und vollständig sind und von uns rechtmäßig verarbeitet werden, können Sie der Verarbeitung dieser Daten in besonderen, von Ihnen begründeten Einzelfällen widersprechen. Ebenso können Sie widersprechen, wenn Sie von uns Direktwerbung beziehen und diese in Zukunft nicht mehr erhalten möchten.

Sie können die von uns zu Ihrer Person verarbeiteten Daten, sofern wir diese von Ihnen selbst erhalten haben, in einem von uns bestimmten, maschinenlesbaren Format erhalten oder uns mit der direkten Übermittlung dieser Daten an einen von Ihnen gewählten Dritten beauftragen, sofern dieser Empfänger uns dies aus technischer Sicht ermöglicht und der Datenübertragung weder ein unvertretbarer Aufwand noch gesetzliche oder sonstige Verschwiegenheitspflichten oder Vertraulichkeitserwägungen von unserer Seite oder von dritten Personen entgegen stehen. Bei all Ihren Anliegen nutzen Sie bitte obenstehende Kontaktmöglichkeit, wobei wir Sie hierbei stets um einen Beleg Ihrer Identität - etwa durch Übermittlung einer Ausweiskopie - ersuchen. Sind Sie der Ansicht, dass wir Ihre Daten in nicht zulässiger Weise verwenden, so steht Ihnen das Recht auf Beschwerdeerhebung bei der österreichischen Datenschutzbehörde offen.

Die Kontaktdaten dafür lauten (Kontrolle der aktuellen Kontaktdaten über:
https://www.dsb.gv.at/kontakt):
Österreichische Datenschutzbehörde
Wickenburggasse 8
1080 Wien
Telefon: +43 1 52 152-0
E-Mail: dsb@dsb.gv.at
"""
        }
    }

    var body: some View {
        ScrollView {
            Text(getMoreText)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(more.rawValue)
                .padding()
        }
    }
}

struct More_Previews: PreviewProvider {
    static var previews: some View {
        MoreView(more: .ContactAndImpressum)
    }
}
