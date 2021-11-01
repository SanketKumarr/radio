import 'package:flutter/material.dart';
import 'package:radio_lnct/widgets/home_tab/animation_widget.dart';

class Post extends StatefulWidget {
  final String postImage;
  final String caption;

  const Post({Key? key, required this.postImage, required this.caption})
      : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool isHeartAnimating = false;
  bool isLiked = false;
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    final likeIcon = isLiked ? Icons.favorite : Icons.favorite_outline;
    final likeColor = isLiked ? Colors.red : Color(0xff242a54);
    final saveIcon =
        isSaved ? Icons.bookmark_rounded : Icons.bookmark_border_rounded;
    final saveColor = isSaved ? Color(0xff242a54) : Color(0xff242a54);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: GestureDetector(
            child: Stack(
              children: [
                Container(
                  width: 330,
                  height: 330,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange, width: 2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        widget.postImage,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 115),
                    child: Opacity(
                      opacity: isHeartAnimating ? 1 : 0,
                      child: AnimationWidget(
                        isAnimating: isHeartAnimating,
                        duration: Duration(milliseconds: 250),
                        onEnd: () => setState(() {
                          isHeartAnimating = false;
                        }),
                        child: Icon(
                          Icons.favorite,
                          size: 90,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onDoubleTap: () {
              setState(() {
                isHeartAnimating = true;
                isLiked = true;
              });
            },
          ),
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Transform.translate(
              offset: Offset(-7, 0),
              child: AnimationWidget(
                alwaysAnimate: true,
                isAnimating: isLiked,
                child: IconButton(
                  icon: Icon(likeIcon),
                  color: likeColor,
                  iconSize: 30,
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              width: 240,
            ),
            AnimationWidget(
              alwaysAnimate: true,
              isAnimating: isSaved,
              child: IconButton(
                icon: Icon(saveIcon),
                color: saveColor,
                onPressed: () {
                  setState(() {
                    isSaved = !isSaved;
                  });
                },
                iconSize: 27,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: 5),
          child: Text(
            widget.caption,
            style: TextStyle(
              fontFamily: "ProductSans",
              fontWeight: FontWeight.w300,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
