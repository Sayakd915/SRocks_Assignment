import 'package:flutter/material.dart' hide SearchBar;
import 'package:provider/provider.dart';
import 'package:srocksproject/screens/profilepage.dart';
import '../viewmodels/service_viewmodel.dart';
import '../widgets/servicecard.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../widgets/searchbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _transcribedText = '';
  final TextEditingController _searchController = TextEditingController();
  String _selectedLocaleId = 'en_US';
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _initializeSpeech();
    _fetchLocales();
  }

  Future<void> _fetchLocales() async {
    List<stt.LocaleName> locales = await _speech.locales();
    for (var locale in locales) {
      if (_selectedLocaleId.isEmpty) {
        _selectedLocaleId = locale.localeId;
      }
    }
  }

  Future<void> _initializeSpeech() async {
    bool available = await _speech.initialize(
      onStatus: (status) {
        if (status == 'done' || status == 'notListening') {
          setState(() {
            _isListening = false;
          });
        }
      },
      onError: (error) {
        setState(() {
          _isListening = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Speech recognition error: $error')),
        );
      },
    );

    if (!available) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Speech recognition unavailable')),
      );
    }
  }

  Future<void> _startListening() async {
    if (!_speech.isAvailable) {
      await _initializeSpeech();
    }

    if (_speech.isAvailable) {
      setState(() {
        _isListening = true;
        _transcribedText = '';
        _searchController.clear();
        _searchFocusNode.requestFocus();
      });

      _speech.listen(
        onResult: (result) {
          setState(() {
            _transcribedText = result.recognizedWords;
            _searchController.text = _transcribedText;
            _searchController.selection = TextSelection.fromPosition(
              TextPosition(offset: _searchController.text.length),
            );
          });
        },
        localeId: _selectedLocaleId,
        partialResults: true,
        cancelOnError: false,
        listenFor: const Duration(seconds: 30),
      );
    } else {
      setState(() {
        _isListening = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Speech recognition not available')),
      );
    }
  }

  void _stopListening() {
    _speech.stop();
    setState(() {
      _isListening = false;
    });
  }

  @override
  void dispose() {
    _speech.stop();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff18171C),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffA90140), Color(0xff550120)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              ),
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          //SearchBar Widget
                          child: SearchBar(
                            controller: _searchController,
                            focusNode: _searchFocusNode,
                            isListening: _isListening,
                            onStartListening: _startListening,
                            onStopListening: _stopListening,
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                        // Profile Button
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                          height: MediaQuery.of(context).size.width * 0.1,
                          child: IconButton(
                            icon: Image.asset(
                              'assets/images/profile_icon.png',
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.width * 0.1,
                            ),
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Profilepage(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Banner and Book Now
                  Center(
                    child: Column(
                      children: [
                        Image.asset('assets/images/banner.png'),
                        const SizedBox(height: 7),
                        const Text(
                          "for custom Music Production",
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontFamily: 'Syne',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 121,
                          width: double.infinity,
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                left: -45,
                                child: Image.asset(
                                  'assets/images/vinyl.png',
                                  height: 121,
                                  width: 121,
                                ),
                              ),
                              Positioned(
                                right: -53,
                                child: Image.asset(
                                  'assets/images/keyboard.png',
                                  height: 121,
                                  width: 121,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 12),
                                ),
                                child: const Text(
                                  "Book Now",
                                  style: TextStyle(
                                    fontFamily: 'Syne',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                "Hire hand-picked Pros for popular music services",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Syne',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Service Cards
            Consumer<ServiceViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (viewModel.errorMessage != null) {
                  return Center(
                    child: Text(
                      viewModel.errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }
                return Column(
                  children: viewModel.services
                      .map((service) => ServiceCard(
                    iconUrl: service.iconUrl,
                    backgroundUrl: service.backgroundUrl,
                    title: service.title,
                    description: service.description,
                  ))
                      .toList(),
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}