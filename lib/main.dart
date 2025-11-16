import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:math';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Career AI - Interview Prep',
      theme: ThemeData(
        fontFamily: 'Inter',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.light,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _navigateToHome();
  }

  void _initializeAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();
  }

  void _navigateToHome() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 1000),
          pageBuilder: (_, __, ___) => const HomePage(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F23),
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated Logo
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6366F1).withOpacity(0.4),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.rocket_launch_rounded,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                // Title with space
                const Text(
                  'CAREER AI',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: 3,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Interview Preparation Coach',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 50),
                // Developers Section
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Developed by',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Lithish Kumar S',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Dilnandh Shan A',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Mohan Raj G',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // Loading Indicator
                SizedBox(
                  width: 200,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.white.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(const Color(0xFF6366F1)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  // Predefined answers for home page categories
  final Map<String, String> _categoryAnswers = {
    "Career Tips": "🌟 30 Career Success Tips:\n\n1. Always arrive 15 minutes early\n2. Dress for the job you want\n3. Master the handshake\n4. Research the company thoroughly\n5. Prepare 5+ questions for the interviewer\n6. Follow up within 24 hours\n7. Customize each resume\n8. Network consistently\n9. Keep learning new skills\n10. Build a personal brand\n11. Set clear career goals\n12. Find a mentor\n13. Be proactive, not reactive\n14. Develop emotional intelligence\n15. Learn to accept feedback\n16. Build strong relationships\n17. Stay organized\n18. Manage your time effectively\n19. Develop communication skills\n20. Be adaptable to change\n21. Take calculated risks\n22. Maintain work-life balance\n23. Stay current with industry trends\n24. Develop leadership skills\n25. Be solution-oriented\n26. Build a strong online presence\n27. Attend industry events\n28. Volunteer for challenging projects\n29. Develop public speaking skills\n30. Never stop learning and growing",

    "Smart Advice": "💡 30 Smart Career Advice Points:\n\n1. Your network determines your net worth\n2. Skills pay the bills\n3. Character outweighs credentials\n4. Consistency beats intensity\n5. Preparation meets opportunity\n6. Listen more than you speak\n7. Quality over quantity always\n8. Reputation is your greatest asset\n9. Adapt or get left behind\n10. Continuous learning is mandatory\n11. Emotional intelligence matters most\n12. Problem-solvers get promoted\n13. Initiative creates opportunities\n14. Reliability builds trust\n15. Professionalism opens doors\n16. Resilience determines success\n17. Curiosity drives innovation\n18. Humility attracts mentors\n19. Courage creates breakthroughs\n20. Integrity is non-negotiable\n21. Accountability builds credibility\n22. Empathy strengthens teams\n23. Vision guides growth\n24. Execution beats ideas\n25. Feedback accelerates growth\n26. Relationships create referrals\n27. Specialization creates value\n28. Automation enhances efficiency\n29. Health enables performance\n30. Balance sustains success",

    "Interview Questions": "❓ 15 Common Interview Questions:\n\n1. Tell me about yourself\n2. Why should we hire you?\n3. What are your strengths?\n4. What are your weaknesses?\n5. Why do you want to work here?\n6. Where do you see yourself in 5 years?\n7. Why are you leaving your current job?\n8. What motivates you?\n9. How do you handle pressure?\n10. Describe a challenging situation\n11. What are your salary expectations?\n12. How do you handle criticism?\n13. What's your leadership style?\n14. How do you prioritize work?\n15. Do you have any questions for us?",

    "Resume Tips": "📄 15 Resume Writing Tips:\n\n1. Keep it to one page\n2. Use a clean, professional format\n3. Include relevant keywords\n4. Quantify achievements with numbers\n5. Use action verbs\n6. Tailor for each job application\n7. Include a professional summary\n8. Highlight relevant skills\n9. List experience in reverse chronological order\n10. Include education and certifications\n11. Add relevant projects\n12. Proofread multiple times\n13. Use a professional email\n14. Include LinkedIn profile\n15. Save as PDF with your name",

    "Salary Negotiation": "💰 15 Salary Negotiation Tips:\n\n1. Research market rates first\n2. Know your minimum acceptable salary\n3. Let them mention numbers first\n4. Consider the entire package\n5. Practice your negotiation pitch\n6. Be confident but polite\n7. Have specific accomplishments ready\n8. Don't be the first to give a number\n9. Consider other negotiables\n10. Understand your leverage\n11. Timing is crucial\n12. Get everything in writing\n13. Be prepared to walk away\n14. Focus on value, not need\n15. Express enthusiasm for the role",

    "Behavioral Questions": "🎯 15 Behavioral Questions:\n\n1. Tell me about a time you failed\n2. Describe a conflict with a coworker\n3. When did you show leadership?\n4. How do you handle tight deadlines?\n5. Describe a successful project\n6. Tell me about a mistake you made\n7. How do you handle criticism?\n8. Describe a time you persuaded someone\n9. When did you go above and beyond?\n10. How do you prioritize multiple tasks?\n11. Describe a time you had to adapt\n12. Tell me about a team conflict\n13. When did you take initiative?\n14. How do you make difficult decisions?\n15. Describe your biggest achievement",
  };

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<double>(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToChat() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 800),
        pageBuilder: (_, __, ___) => const ChatPage(),
        transitionsBuilder: (_, animation, __, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
            child: child,
          );
        },
      ),
    );
  }

  void _showCategoryAnswer(String category) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF0F0F23),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    category,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    _categoryAnswers[category]!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F23),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _slideAnimation.value),
              child: Opacity(
                opacity: _fadeAnimation.value,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome to',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                              const Text(
                                'CAREER AI',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Icon(
                              Icons.rocket_launch_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),

                      // Main Card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF1E1E3F), Color(0xFF2D2B55)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF6366F1).withOpacity(0.3),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF6366F1).withOpacity(0.4),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.auto_awesome_rounded,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Ready to Ace Your Interview?',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'Get personalized coaching, practice questions, and expert tips to land your dream job.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white.withOpacity(0.8),
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 30),
                            // Start Button
                            GestureDetector(
                              onTap: _navigateToChat,
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF6366F1).withOpacity(0.4),
                                      blurRadius: 15,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Start Coaching Session',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 20),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Features Grid
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 1.2,
                          children: [
                            _buildFeatureCard(
                              icon: Icons.tips_and_updates_rounded,
                              title: 'Career Tips',
                              color: const Color(0xFF10B981),
                              count: '30+ Tips',
                              onTap: () => _showCategoryAnswer('Career Tips'),
                            ),
                            _buildFeatureCard(
                              icon: Icons.auto_awesome_rounded,
                              title: 'Smart Advice',
                              color: const Color(0xFF8B5CF6),
                              count: '30+ Points',
                              onTap: () => _showCategoryAnswer('Smart Advice'),
                            ),
                            _buildFeatureCard(
                              icon: Icons.question_answer_rounded,
                              title: 'Interview Qs',
                              color: const Color(0xFFF59E0B),
                              count: '15 Questions',
                              onTap: () => _showCategoryAnswer('Interview Questions'),
                            ),
                            _buildFeatureCard(
                              icon: Icons.description_rounded,
                              title: 'Resume Tips',
                              color: const Color(0xFFEF4444),
                              count: '15 Tips',
                              onTap: () => _showCategoryAnswer('Resume Tips'),
                            ),
                            _buildFeatureCard(
                              icon: Icons.attach_money_rounded,
                              title: 'Salary Negotiation',
                              color: const Color(0xFF06B6D4),
                              count: '15 Points',
                              onTap: () => _showCategoryAnswer('Salary Negotiation'),
                            ),
                            _buildFeatureCard(
                              icon: Icons.psychology_rounded,
                              title: 'Behavioral Qs',
                              color: const Color(0xFF8B5CF6),
                              count: '15 Questions',
                              onTap: () => _showCategoryAnswer('Behavioral Questions'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required Color color,
    required String count,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E3F),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              count,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  final List<ChatMessage> _messages = [];

  Map<String, String> _qaMap = {};
  bool _isLoadingData = true;
  bool _isSending = false;
  bool _showScrollButton = false;

  late AnimationController _typingAnimationController;
  late AnimationController _sendButtonAnimationController;
  late Animation<double> _sendButtonScaleAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _loadQAData();
    _scrollController.addListener(_scrollListener);
  }

  void _initializeAnimations() {
    _typingAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _sendButtonAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _sendButtonScaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _sendButtonAnimationController, curve: Curves.easeInOut)
    );

    _sendButtonAnimationController.forward();
  }

  Future<void> _loadQAData() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/qa_data.json');
      final List<dynamic> jsonData = json.decode(jsonString);
      
      Map<String, String> loadedData = {};
      for (var item in jsonData) {
        loadedData[item['q'].toString().toLowerCase().trim()] = item['a'].toString();
      }

      setState(() {
        _qaMap = loadedData;
        _isLoadingData = false;
        _addWelcomeMessage();
      });
    } catch (e) {
      print('Error loading QA data: $e');
      _loadDefaultQuestions();
    }
  }

  void _loadDefaultQuestions() {
    final Map<String, String> defaultData = {
      "tell me about yourself": "Start with your current role/education, highlight relevant experience and skills, connect to the position you're applying for, and express enthusiasm for the opportunity.",
      "what are your strengths": "Choose 3-4 strengths relevant to the job, provide specific examples, and show how they've helped you succeed in past roles or academic projects.",
      "why should we hire you": "Highlight your unique combination of skills, experience, and enthusiasm that matches the job requirements and company culture.",
      "what are your weaknesses": "Choose a real but manageable weakness, show self-awareness, and explain steps you're taking to improve.",
      "where do you see yourself in 5 years": "Show ambition aligned with company growth, mention skill development, and express interest in growing with the organization.",
    };
    
    setState(() {
      _qaMap = defaultData;
      _isLoadingData = false;
      _addWelcomeMessage();
    });
  }

  void _addWelcomeMessage() {
    final welcomeMessage = ChatMessage(
      text: "🚀 **Welcome to CAREER AI Coaching!**\n\nI'm your AI interview coach loaded with career knowledge from your JSON file. You can ask me any interview-related questions and I'll provide answers based on the data.\n\nTry asking questions like:\n• Tell me about yourself\n• What are common interview mistakes?\n• How to negotiate salary?\n• Resume writing tips\n• Behavioral questions practice\n\nWhat would you like to know?",
      isUser: false,
    );

    setState(() {
      _messages.add(welcomeMessage);
    });
    _scrollToBottom();
  }

  String getAnswer(String question) {
    question = question.toLowerCase().trim();
    
    // Exact match
    if (_qaMap.containsKey(question)) {
      return _qaMap[question]!;
    }
    
    // Keyword matching
    final List<String> keywords = question
        .replaceAll(RegExp(r'[^\w\s]+'), '')
        .split(RegExp(r'\s+'))
        .where((word) => word.length > 3)
        .toList();

    String? bestMatchKey;
    int highestScore = 0;
    
    _qaMap.forEach((key, answer) {
      int currentScore = 0;
      
      for (String keyword in keywords) {
        if (key.contains(keyword)) {
          currentScore += 10;
        }
      }

      if (currentScore > highestScore) {
        highestScore = currentScore;
        bestMatchKey = key;
      }
    });

    if (highestScore >= 15 && bestMatchKey != null) {
      return _qaMap[bestMatchKey]!;
    }
    
    return "I understand you're asking about: \"$question\"\n\nWhile I have extensive career knowledge loaded from the JSON file, I don't have a specific answer for that exact question in my database. Try asking about common interview topics, resume tips, salary negotiation, or behavioral questions!";
  }

  void _scrollToBottom() {
    if (!_scrollController.hasClients) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void _scrollListener() {
    if (_scrollController.hasClients) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;
      setState(() {
        _showScrollButton = currentScroll < maxScroll - 300;
      });
    }
  }

  void _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty || _isLoadingData) return;

    final userMessage = ChatMessage(text: text, isUser: true);
    
    HapticFeedback.mediumImpact();
    
    setState(() {
      _messages.add(userMessage);
      _controller.clear();
      _isSending = true;
    });
    
    _scrollToBottom();
    _sendButtonAnimationController.reverse();

    await Future.delayed(const Duration(milliseconds: 800));

    final botAnswer = getAnswer(text);
    final botMessage = ChatMessage(text: botAnswer, isUser: false);

    setState(() {
      _messages.add(botMessage);
      _isSending = false;
    });
    
    _scrollToBottom();
    _focusNode.requestFocus();
  }

  Widget _buildMessageBubble(ChatMessage msg) {
    final isUser = msg.isUser;
    final maxWidth = MediaQuery.of(context).size.width * 0.75;

    return Padding(
      padding: EdgeInsets.fromLTRB(isUser ? 50 : 16, 8, isUser ? 16 : 50, 8),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) _buildBotAvatar(),
          Flexible(
            child: Container(
              constraints: BoxConstraints(maxWidth: maxWidth),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isUser 
                    ? const Color(0xFF6366F1)
                    : const Color(0xFF1E1E3F),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                  bottomLeft: isUser ? const Radius.circular(20) : const Radius.circular(4),
                  bottomRight: isUser ? const Radius.circular(4) : const Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                msg.text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  height: 1.4,
                ),
              ),
            ),
          ),
          if (isUser) _buildUserAvatar(),
        ],
      ),
    );
  }

  Widget _buildBotAvatar() {
    return Container(
      margin: const EdgeInsets.only(right: 8, top: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withOpacity(0.4),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: const Icon(Icons.auto_awesome_rounded, size: 16, color: Colors.white),
    );
  }

  Widget _buildUserAvatar() {
    return Container(
      margin: const EdgeInsets.only(left: 8, top: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E3F),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Icon(Icons.person_rounded, size: 16, color: Colors.white),
    );
  }

  Widget _buildTypingIndicator() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildBotAvatar(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E3F),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                  child: AnimatedBuilder(
                    animation: _typingAnimationController,
                    builder: (context, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildTypingDot(0),
                          _buildTypingDot(1),
                          _buildTypingDot(2),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'CAREER AI is thinking...',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypingDot(int index) {
    return ScaleTransition(
      scale: DelayTween(begin: 0.3, end: 1.0, delay: index * 0.2)
          .animate(_typingAnimationController),
      child: Container(
        width: 6,
        height: 6,
        decoration: BoxDecoration(
          color: const Color(0xFF6366F1),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _buildInputDock() {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
      padding: EdgeInsets.fromLTRB(16, 12, 16, 12 + bottomPadding),
      decoration: BoxDecoration(
        color: const Color(0xFF0F0F23),
        border: Border(
          top: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E3F),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
              ),
              child: TextField(
  focusNode: _focusNode,
  controller: _controller,
  textInputAction: TextInputAction.send,
  onSubmitted: (_) => _sendMessage(),
  onChanged: (text) {
    if (text.isNotEmpty) {
      _sendButtonAnimationController.forward();
    } else {
      _sendButtonAnimationController.reverse();
    }
    setState(() {}); // Add this line
  },
  enabled: !_isLoadingData && !_isSending,
  style: const TextStyle(color: Colors.white, fontSize: 16),
  decoration: InputDecoration(
    hintText: 'Ask any career or interview question...',
    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
    border: InputBorder.none,
    contentPadding: const EdgeInsets.symmetric(vertical: 12),
  ),
),
            ),
          ),
          const SizedBox(width: 12),
          ScaleTransition(
  scale: _sendButtonScaleAnimation,
  child: GestureDetector(
    onTap: () {
      if (_controller.text.trim().isNotEmpty && !_isLoadingData && !_isSending) {
        _sendMessage();
      }
    },
    child: Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        gradient: (_controller.text.trim().isNotEmpty && !_isLoadingData && !_isSending)
            ? const LinearGradient(
                colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : LinearGradient(
                colors: [Colors.grey.shade600, Colors.grey.shade700],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: (_controller.text.trim().isNotEmpty && !_isLoadingData && !_isSending)
                ? const Color(0xFF6366F1).withOpacity(0.4)
                : Colors.grey.withOpacity(0.4),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Icon(
        Icons.send_rounded,
        color: Colors.white,
        size: 22,
      ),
    ),
  ),
),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _typingAnimationController.dispose();
    _sendButtonAnimationController.dispose();
    _scrollController.removeListener(_scrollListener);
    _controller.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F23),
      appBar: AppBar(
        title: const Text(
          'CAREER AI Coach',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF0F0F23),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline_rounded, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          if (_isLoadingData)
            LinearProgressIndicator(
              backgroundColor: const Color(0xFF1E1E3F),
              valueColor: AlwaysStoppedAnimation<Color>(const Color(0xFF6366F1)),
            ),
          
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length + (_isSending ? 1 : 0),
              padding: const EdgeInsets.only(bottom: 20),
              itemBuilder: (context, index) {
                if (index == _messages.length) {
                  return _buildTypingIndicator();
                }
                return _buildMessageBubble(_messages[index]);
              },
            ),
          ),
          
          _buildInputDock(),
        ],
      ),
      floatingActionButton: _showScrollButton ? FloatingActionButton(
        onPressed: _scrollToBottom,
        mini: true,
        backgroundColor: const Color(0xFF6366F1),
        child: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white),
      ) : null,
    );
  }
}

// Data Models
class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime time;

  ChatMessage({
    required this.text,
    required this.isUser,
    DateTime? time,
  }) : time = time ?? DateTime.now();
}

class DelayTween extends Tween<double> {
  DelayTween({double? begin, double? end, required this.delay})
      : super(begin: begin, end: end);

  final double delay;

  @override
  double lerp(double t) {
    return super.lerp((t - delay).clamp(0.0, 1.0));
  }

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}