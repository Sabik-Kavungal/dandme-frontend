import 'package:flutter/material.dart';

/// Default country code (India)
const CountryCode defaultCountryCode = CountryCode(
  name: 'India',
  code: 'IN',
  flag: '🇮🇳',
  dialCode: '+91',
);

/// Country code data model
class CountryCode {
  final String name;
  final String code;
  final String flag;
  final String dialCode;

  const CountryCode({
    required this.name,
    required this.code,
    required this.flag,
    required this.dialCode,
  });
}

/// Country code dropdown widget with exact design from the image
class CountryCodeDropdown extends StatefulWidget {
  final CountryCode? selectedCountry;
  final Function(CountryCode) onCountrySelected;
  final double scaleFactor;
  final bool isEnabled;

  const CountryCodeDropdown({
    super.key,
    this.selectedCountry,
    required this.onCountrySelected,
    this.scaleFactor = 1.0,
    this.isEnabled = true,
  });

  @override
  State<CountryCodeDropdown> createState() => _CountryCodeDropdownState();
}

class _CountryCodeDropdownState extends State<CountryCodeDropdown>
    with TickerProviderStateMixin {
  bool _isDropdownOpen = false;
  late AnimationController _animationController;
  late Animation<double> _animation;
  final TextEditingController _searchController = TextEditingController();
  List<CountryCode> _filteredCountries = [];
  OverlayEntry? _overlayEntry;

  // Supported countries as per requirements
  static const List<CountryCode> _countries = [
    CountryCode(name: 'India', code: 'IN', flag: '🇮🇳', dialCode: '+91'),
    CountryCode(name: 'UAE', code: 'AE', flag: '🇦🇪', dialCode: '+971'),
    CountryCode(
      name: 'Saudi Arabia',
      code: 'SA',
      flag: '🇸🇦',
      dialCode: '+966',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _filteredCountries = _countries;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
    _removeOverlay();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      final query = _searchController.text.toLowerCase();
      _filteredCountries = _countries.where((country) {
        return country.name.toLowerCase().contains(query) ||
            country.dialCode.contains(query);
      }).toList();
    });
  }

  void _toggleDropdown() {
    if (!widget.isEnabled) return;

    setState(() {
      _isDropdownOpen = !_isDropdownOpen;
      if (_isDropdownOpen) {
        _animationController.forward();
        _showOverlay();
      } else {
        _animationController.reverse();
        _removeOverlay();
      }
    });
  }

  void _showOverlay() {
    _removeOverlay();
    _overlayEntry = OverlayEntry(builder: (context) => _buildDropdownOverlay());
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _selectCountry(CountryCode country) {
    widget.onCountrySelected(country);
    _toggleDropdown();
    _searchController.clear();
    _filteredCountries = _countries;
  }

  Widget _buildDropdownOverlay() {
    return Positioned(
      top: _getDropdownTopPosition(),
      left: _getDropdownLeftPosition(),
      child: Material(
        color: Colors.transparent,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              alignment: Alignment.topCenter,
              child: Opacity(
                opacity: _animation.value,
                child: _buildDropdownContent(),
              ),
            );
          },
        ),
      ),
    );
  }

  double _getDropdownTopPosition() {
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      return position.dy + renderBox.size.height + 2;
    }
    return 0;
  }

  double _getDropdownLeftPosition() {
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      return position.dx;
    }
    return 0;
  }

  Widget _buildDropdownContent() {
    return Container(
      width: 280 * widget.scaleFactor,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_buildSearchField(), _buildCountriesList()],
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      padding: EdgeInsets.all(12 * widget.scaleFactor),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: TextField(
        controller: _searchController,
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Search for countries',
          hintStyle: TextStyle(
            color: Colors.grey[500],
            fontSize: 14 * widget.scaleFactor,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey[500],
            size: 20 * widget.scaleFactor,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 8 * widget.scaleFactor,
            vertical: 8 * widget.scaleFactor,
          ),
        ),
        style: TextStyle(fontSize: 14 * widget.scaleFactor),
      ),
    );
  }

  Widget _buildCountriesList() {
    return Container(
      constraints: BoxConstraints(maxHeight: 200 * widget.scaleFactor),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _filteredCountries.length,
        itemBuilder: (context, index) {
          final country = _filteredCountries[index];
          final isSelected = widget.selectedCountry?.code == country.code;
          final isDefault = country.code == defaultCountryCode.code;

          return _buildCountryItem(country, isSelected, isDefault);
        },
      ),
    );
  }

  Widget _buildCountryItem(
    CountryCode country,
    bool isSelected,
    bool isDefault,
  ) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _selectCountry(country),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12 * widget.scaleFactor,
            vertical: 10 * widget.scaleFactor,
          ),
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.blue.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              // Flag
              Text(
                country.flag,
                style: TextStyle(fontSize: 20 * widget.scaleFactor),
              ),
              SizedBox(width: 12 * widget.scaleFactor),
              // Country name
              Expanded(
                child: Text(
                  country.name,
                  style: TextStyle(
                    fontSize: 14 * widget.scaleFactor,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              // Dial code
              Text(
                '(${country.dialCode})',
                style: TextStyle(
                  fontSize: 14 * widget.scaleFactor,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(width: 8 * widget.scaleFactor),
              // Checkmark for selected country
              if (isSelected)
                Icon(
                  Icons.check,
                  color: Colors.blue,
                  size: 18 * widget.scaleFactor,
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedCountry = widget.selectedCountry ?? defaultCountryCode;

    return GestureDetector(
      onTap: _toggleDropdown,
      child: Container(
        height: 40 * widget.scaleFactor,
        decoration: BoxDecoration(
          color: widget.isEnabled ? Colors.white : Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: widget.isEnabled
                ? Colors.grey.withOpacity(0.3)
                : Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Flag
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8 * widget.scaleFactor),
              child: Text(
                selectedCountry.flag,
                style: TextStyle(fontSize: 18 * widget.scaleFactor),
              ),
            ),
            // Dial code
            Text(
              selectedCountry.dialCode,
              style: TextStyle(
                fontSize: 14 * widget.scaleFactor,
                fontWeight: FontWeight.w500,
                color: widget.isEnabled ? Colors.grey[800] : Colors.grey[500],
              ),
            ),
            SizedBox(width: 4 * widget.scaleFactor),
            // Dropdown arrow
            AnimatedRotation(
              turns: _isDropdownOpen ? 0.5 : 0,
              duration: const Duration(milliseconds: 200),
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 16 * widget.scaleFactor,
                color: widget.isEnabled ? Colors.grey[600] : Colors.grey[400],
              ),
            ),
            SizedBox(width: 8 * widget.scaleFactor),
          ],
        ),
      ),
    );
  }
}

/// Phone number input field with integrated country code dropdown
class PhoneNumberField extends StatefulWidget {
  final TextEditingController phoneController;
  final String? label;
  final String? hint;
  final bool isRequired;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final double scaleFactor;
  final bool isEnabled;

  const PhoneNumberField({
    super.key,
    required this.phoneController,
    this.label,
    this.hint,
    this.isRequired = false,
    this.onChanged,
    this.validator,
    this.scaleFactor = 1.0,
    this.isEnabled = true,
  });

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  CountryCode _selectedCountry = defaultCountryCode;
  final FocusNode _phoneFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _phoneFocusNode.addListener(_onPhoneFocusChanged);
  }

  @override
  void dispose() {
    _phoneFocusNode.dispose();
    super.dispose();
  }

  void _onPhoneFocusChanged() {
    // You can add logic here if needed when phone field gains/loses focus
  }

  void _onCountrySelected(CountryCode country) {
    setState(() {
      _selectedCountry = country;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label! + (widget.isRequired ? ' *' : ''),
            style: TextStyle(
              fontSize: 14 * widget.scaleFactor,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 6 * widget.scaleFactor),
        ],
        Row(
          children: [
            // Country code dropdown
            CountryCodeDropdown(
              selectedCountry: _selectedCountry,
              onCountrySelected: _onCountrySelected,
              scaleFactor: widget.scaleFactor,
              isEnabled: widget.isEnabled,
            ),
            SizedBox(width: 8 * widget.scaleFactor),
            // Phone number input
            Expanded(
              child: TextFormField(
                controller: widget.phoneController,
                focusNode: _phoneFocusNode,
                enabled: widget.isEnabled,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: widget.hint ?? 'Phone number',
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14 * widget.scaleFactor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.blue.withOpacity(0.5),
                      width: 2,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12 * widget.scaleFactor,
                    vertical: 10 * widget.scaleFactor,
                  ),
                ),
                style: TextStyle(fontSize: 14 * widget.scaleFactor),
                onChanged: widget.onChanged,
                validator: widget.validator,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
