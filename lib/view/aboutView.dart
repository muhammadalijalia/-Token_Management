import 'package:flutter/material.dart';
import '../Utils/my_color.dart';
import '../widgets/texts/my_text.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: MyText(
          text: "About Us",
          textStyle: TextStyle(
              fontSize: 17.0,
              color: MyColor.black1,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: MyColor.white1,
        child: SingleChildScrollView(
          child: MyText(
              text: """About Us - Championing Life Through Blood Donation
                  At Champion Blood Donation, we believe in the incredible power of humanity coming together to save lives. Our mission is to bridge the gap between those in need and the generous donors who selflessly give the gift of life through blood donation.
                  Established in [Year], our organization has been a steadfast advocate for promoting the life-saving act of blood donation. With deep roots in local communities, we've created a network of passionate individuals committed to making a positive impact on the world. Every drop of blood donated represents a beacon of hope, and we are dedicated to ensuring that this hope reaches those who need it the most.
                  Our Vision
                  Our vision is a world where no one suffers due to lack of blood. We envision a community united in the common goal of saving lives and fostering a culture where blood donation is not just a necessity, but a shared responsibility.
                  What We Do
                  Blood Drives: We organize regular blood drives in collaboration with hospitals, educational institutions, and corporate partners. These events provide a convenient platform for individuals to donate blood and contribute to a constant and sufficient supply for patients in need.
                  Awareness Campaigns: Education is key to dispelling myths and misconceptions about blood donation. We conduct awareness campaigns in schools, colleges, and public spaces to inform people about the importance of donating blood and the ease of the process.
                  Donor Support: We value our donors and strive to create a supportive environment for them. Whether it's through our helpline, donor appreciation events, or informative resources, we ensure that our donors feel valued and well-informed.
                  Partnerships: Collaboration is at the heart of our efforts. We work closely with medical institutions, non-profit organizations, and governmental agencies to maximize our impact and reach.
                  Why Choose Us
                  Choosing Champion Blood Donation means choosing a partner in the journey of saving lives. With our unwavering commitment to excellence and transparency, we assure you that your contribution will directly impact the lives of individuals facing medical challenges. We adhere to the highest standards of safety and ethical practices, ensuring that your act of kindness makes a meaningful difference.
                  Join Us
                   Every drop counts, and every donor is a hero. Join us in our mission to create a world where blood donation is not just a necessity during crises, but a continuous, life-affirming practice. Whether you're an individual, an organization, or a medical professional, there's a place for you in our community of lifesavers.
                  Thank you for being a part of our journey. Together, we champion life through blood donation.""",
              textStyle: const TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}
