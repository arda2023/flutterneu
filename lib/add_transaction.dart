import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

// ─────────────────────────────────────────────────────────────────
// KATEGORIE-MODELL
// ─────────────────────────────────────────────────────────────────
// Statt für jede Kategorie eigenen IconButton-Code zu schreiben,
// beschreiben wir eine Kategorie als simples Datenobjekt: Name + Icon.
// Neue Kategorie hinzufügen = neue Zeile in der Liste unten,
// KEIN neuer Widget-Code nötig.
class Category {
  final String label;
  final IconData icon;

  const Category({required this.label, required this.icon});
}

// Die Liste aller verfügbaren Kategorien. Willst du später eine neue
// Kategorie hinzufügen, reicht ein neuer Eintrag hier — der Rest der
// App (Anzeige, Auswahl-Logik) passt sich automatisch an, weil wir
// unten über diese Liste iterieren statt sie hart zu verdrahten.
const List<Category> availableCategories = [
  Category(label: "Food", icon: Icons.local_dining),
  Category(label: "Games", icon: Icons.games),
  Category(label: "Travel", icon: Icons.airplane_ticket),
  Category(label: "Clothes", icon: Icons.checkroom),
];

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  // Hält fest, WELCHE Kategorie gerade ausgewählt ist.
  // null = noch keine Auswahl getroffen.
  //
  // Warum State und nicht einfach eine lokale Variable im build()?
  // Weil build() bei jedem Rebuild komplett neu ausgeführt wird —
  // eine normale Variable würde dabei jedes Mal auf ihren Startwert
  // zurückgesetzt. Nur `State`-Felder überleben zwischen Rebuilds.
  Category? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Transaction", style: theme.textTheme.titleMedium),
        backgroundColor: Colors.transparent, // passt gut zum Dark-Theme
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FDateField(
                calendar: const FDateFieldGridSplitCalendarProperties(),
                label: const Text('Date'),
                description: const Text('Select a date for this transaction'),
                onChange: (DateTime? date) {
                  // Hier erhältst du das ausgewählte Datum
                  if (date != null) {
                    setState(() {
                      _selectedDate = date;
                    });
                  }
                },
              ),
              TextField(
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '\$',
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Category",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ─────────────────────────────────────────────
                  // HIER die eigentliche Verbesserung:
                  // .map() erzeugt aus JEDEM Category-Objekt in der
                  // Liste automatisch einen IconButton — egal ob die
                  // Liste 4 oder 40 Einträge hat, der Code bleibt
                  // gleich lang.
                  // ─────────────────────────────────────────────
                  children: availableCategories.map((category) {
                    final bool isSelected = _selectedCategory == category;

                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: IconButton.outlined(
                        onPressed: () {
                          // setState() sagt Flutter: "Zustand hat sich
                          // geändert, bau build() bitte neu auf."
                          // Ohne setState() würde sich zwar die Variable
                          // ändern, aber die UI nichts davon merken.
                          setState(() {
                            _selectedCategory = category;
                          });
                        },
                        icon: Icon(category.icon),
                        style: IconButton.styleFrom(
                          foregroundColor: isSelected
                              ? theme.colorScheme.primary
                              : Colors.white,
                          side: BorderSide(
                            // Genau deine gewünschte Logik:
                            // ausgewählt -> primärfarben (blau),
                            // nicht ausgewählt -> weiß
                            color: isSelected
                                ? theme.colorScheme.primary
                                : Colors.white,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          fixedSize: const Size(62, 62),
                        ),
                      ),
                    );
                  }).toList(), // .map() liefert ein "Iterable" zurück,
                  // Row(children: ...) braucht aber konkret eine List<Widget>
                  // -> deshalb .toList() am Ende.
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
