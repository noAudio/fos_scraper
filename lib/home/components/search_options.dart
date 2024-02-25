import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart' as fl;
import 'package:fos_scraper/scrape_status/scrape_status.dart';

class SearchOptions extends StatefulWidget {
  const SearchOptions({super.key});

  @override
  State<SearchOptions> createState() => _SearchOptionsState();
}

class _SearchOptionsState extends State<SearchOptions> {
  DateTime? endDate;
  DateTime? startDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            children: [
              fl.InfoLabel(
                label: 'Keyword or Product',
                child: const SizedBox(
                  width: 250,
                  child: fl.TextBox(
                    autofocus: true,
                  ),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              fl.InfoLabel(
                label: 'Business name',
                child: const SizedBox(
                  width: 250,
                  child: fl.TextBox(),
                ),
              ),
            ],
          ),
        ),
        // within
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              fl.InfoLabel(label: 'Within'),
              const Option(label: 'Banking, credit and mortgages'),
              const Option(label: 'Investment and pensions'),
              const Option(label: 'Insurance (excluding PPI)'),
              const Option(label: 'Payment protection insurance (PPI)'),
              const Option(label: 'Claims Management Ombudsman decisions'),
              const Option(label: 'Funeral plans'),
            ],
          ),
        ),
        // date range
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            children: [
              fl.DatePicker(
                header: 'Date from',
                selected: startDate,
                onChanged: (time) => setState(() => startDate = time),
              ),
              const SizedBox(
                width: 25,
              ),
              fl.DatePicker(
                header: 'Date to',
                selected: endDate,
                onChanged: (time) => setState(() => endDate = time),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              fl.InfoLabel(label: 'Decisions that were'),
              const Option(label: 'Upheld'),
              const Option(label: 'Not upheld'),
            ],
          ),
        ),
        fl.FilledButton(
          child: const fl.Text('Search'),
          onPressed: () => setState(() => print('Searching!')),
        ),
        const ScrapeStatus(),
      ],
    );
  }
}

class Option extends StatefulWidget {
  final String label;
  const Option({super.key, required this.label});

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return fl.InfoLabel(
      label: widget.label,
      isHeader: false,
      child: fl.Checkbox(
        checked: isChecked,
        onChanged: (value) => setState(() => isChecked = value),
      ),
    );
  }
}
