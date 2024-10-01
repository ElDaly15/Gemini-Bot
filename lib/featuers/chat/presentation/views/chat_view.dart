import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gemini_chat_bot/core/utils/styles.dart';
import 'package:gemini_chat_bot/featuers/chat/presentation/views/widgets/chat_bubble.dart';
import 'package:gemini_chat_bot/featuers/chat/presentation/views/widgets/custom_text_field.dart';

class ChatView extends StatefulWidget {
  const ChatView({
    super.key,
  });

  @override
  State<ChatView> createState() => _UsersChatViewState();
}

class _UsersChatViewState extends State<ChatView> {
  TextEditingController controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  TextEditingController textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  String? text;

  // Dummy chat data for example

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Chat With Gemini',
          style: Style.font22Bold(context)
              .copyWith(color: const Color.fromARGB(255, 133, 44, 74)),
        ),
      ),
      backgroundColor: const Color(0xffffffff),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SafeArea(
              child: SizedBox(),
            ),
            Expanded(
              child: ListView.builder(
                reverse: true,
                controller: _scrollController,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return index % 2 == 0
                      ? ChatWidgetBubble(msg: 'Hi')
                      : ChatWidgetBubblefriend(msg: 'hi');
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              color: Colors.white,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: CustomTextField(
                      onFieldSubmitted: (msg) {},
                      focusNode: _focusNode,
                      hintTitle: 'send a chat message',
                      textEditingController: textEditingController,
                      obscure: false,
                      onSubmit: (value) {
                        text = value;
                        setState(() {});
                      },
                      isPassword: false,
                    ),
                  ),
                  IconButton(
                    onPressed: text == null || text == ''
                        ? null
                        : () {
                            textEditingController.clear();
                            // Simulate message send, add new message
                            setState(() {});
                            _focusNode.unfocus();
                            text = '';
                          },
                    icon: Icon(
                      FontAwesomeIcons.paperPlane,
                      color: text == null || text == ''
                          ? Colors.grey
                          : Color.fromARGB(255, 46, 4, 48),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Dummy message model class
