import 'package:flutter/material.dart';

class ActivityBoxes extends StatelessWidget {
  const ActivityBoxes({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 1,
      itemBuilder: (context, index) {
        return _activityBoxExample();
      },
    );
  }

  Container _activityBoxExample(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFF808B9A)
        )
      ),
      child: Row(
        children: [
          ClipRRect(
            child: Image.asset('assets/images/gym_zall.png',fit: BoxFit.cover, width: 40, height: 40,),
          ),
          Column(
            children: [
              const Text('Running', style: TextStyle(fontSize: 18)),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFF808B9A)
                  )
                ),
                child: Row(
                  children: const[
                    Icon(Icons.timer),
                    Text('1h34min')
                  ],
                ),
              ),
            ],
          ),
          const Text("2.5 km", style: TextStyle(fontSize: 18))
        ],
      ),
    );
  }
}