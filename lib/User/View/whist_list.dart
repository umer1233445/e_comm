import 'package:flutter/material.dart';
import 'package:umer/User/Controller/user_services.dart';
import 'package:umer/User/Model/user_model.dart';
import 'package:umer/User/View/update_user.dart';
import 'package:umer/User/View/user_login.dart';
import 'package:umer/User/View/user_register.dart';

class Whist_List extends StatefulWidget {
  const Whist_List({super.key
  });
  @override
  State<Whist_List> createState() => _Whist_ListState();
}

class _Whist_ListState extends State<Whist_List> {

  UserFirebaseServices uServices = UserFirebaseServices();
  String uEmail = "";
  @override
  void initState() {

    setState(() {
      UserFirebaseServices.getUserCred().then((value) {
        setState(() {
          uEmail = value;

        });

      });
    });

    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Whist List"),
      ),


      drawer: Drawer(
        width: 300,
        child:StreamBuilder(stream: uServices.fetchUser(uEmail),
          builder: (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
          if(snapshot.hasData){
        var userLength = snapshot.data!.length;

          return ListView.builder(
            itemCount: userLength,
       itemBuilder: (context, index) {
        UserModel userData = snapshot.data![index];
        return Container(
          height: 470,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBw8PDxAPEBAPEBAQDw8PDw4PDRAPDw8QFhUXFhUVFRUYHSggGBolHRUVITEhJSorLi4uFx8zODMtNygtLisBCgoKDg0OFxAQGi0lHR0tLS0tLS0tLS0tLSsrLS0tLS0tLS0tLSstKystLS0uKy0rLS0tLS0rKy0tLS0tKy0tLf/AABEIAQQAwgMBIgACEQEDEQH/xAAcAAAABwEBAAAAAAAAAAAAAAAAAQIDBAUGBwj/xABGEAACAQMABwMIBwUHAwUAAAABAgADBBEFBhIhMUFRE2FxByIygZGhsdEUI0JScoLBM2KSk7JDU1RzlOHwNKLSFRYkY4P/xAAZAQEBAQEBAQAAAAAAAAAAAAAAAQIDBAX/xAAjEQEBAAICAgICAwEAAAAAAAAAAQIRAxITITFRBEEiMmEU/9oADAMBAAIRAxEAPwDqcMCHiGBODYYh4hgQ8ShOIeIrEGICcQ8Q8Q8QEwovELEBOIWIvELEBGIREcIiSICIkiOERJEimyIgiOkRDCZUywjbCPERthIGGEaYSQwjTCRUdhGXEksIy4kUxBFYghWpxDAh4hidnIMQ8QYh4gDEGIcOUJxDxDxBiAWIWIrEGICcQYioMQEYhERZEIiQNkRJEcIiSJA2REkRwiIIkU0wjbCPMI2wkUwwjTCSGEZYTKmGEZcR9xGmEimIIrEEitTiHiCGJ6HEAIcEMCAMQYhw8QCxBiHiDEAoIrEGIUmFiKgxATiERFQYgNkQiIsiJMgbIiSI4REkSKaIjbCPMI2wmVhhhGmEkMIywkVHcRhhJLiMuJlTOIUViCRWoghiHPQ4hiHiCHALEPEEOFFDghygoIcEgKFiKhRoFiFFQiICYkiLiTIEERJEcMQZA2wjbCPERthJVhlhGWEkMIy8y0jsIw8ktGHEysMwQ4JFaeHBBPQ4hFQocKEOCHKgocEOAUEOFAKCHBAKEYqFCkmJMXEmZCTEmLMSYDZiGEcMQ0zVMsIy4khoy0zWojuIy4khhGXEzVhjEEViCRWkhiFFT0OIQ4IcoEOCCAIIcEoKCHBAQ7hRknAjf0hTwyfBTG9I0yyED4ZiNDnFFFOQy7QIO4+kd+Om8S6RLVs8iPEQGKjb1FHFgPEzKjhGI+kJ94erfFg5ksUkxJizEmQIMQwjhiDJQ00ZaPsI0wma1DDxhxJDRlxMVoxiCKxBIrRQxCEMT0OIxDgEMSgQ4lWB4HOCQfERQgCHBBKBBBEu2IRT6ZPmH1yh1UGL499u/wDWs1F5QRxhmI8JU21vStqvbKSxCFMEj0Sc+3dNW+hpcTPaRyt1Qb7JqqG4/a3DI8SJdGsHpq6nc2CD3TC633tVfRqVF3/ZqMPgYk9DfBQOQHqglRqhUZ7G3ZiWJRssxJJ89hvJluZiqSYkxUIzKkGIMWYgyUNtGmjzRlpmtQy8ZePtGHmK0bghwSC/ihCjN/eJb0aleocJSQux54HId54T0b05KjWvWqjo5BtDtKzjNOiDgkfeY/ZWcy0l5Q9I1iQKi0EP2aKYbH4jk+zEodO6VqXVepXqHznYkDO5V+yo7gN0qHeeLLlyyvr4TbsHko1j7dKtpUYmqrPXpljkujHz9/Mhjn806JPNmrWkmtby2rg42KybXQ0ydlx/CTPSDVlCmptDYCliwORsgZJno4Mv46+gpmABJIAAySTgAd8asrpK1NaqEMjjKsOBGeInB9btdLnSLvss1O0DYpUFOA45NU+8TxxwHvnUvJZX29FUATko9ZD3YqMQPYRNY8nbLUas9NbIt02G/L+pkqQ7z0vyj4mdWVZeViM8PZKqrUJB4ewSfeytPAzllWpF/oUn6NTDbvSPqLEj3GVWndB0q/pVSPwqP1llSfFJP8tP6RKbSVyw5zp21E1tZ6t1adFKdmGJKB9hjjLbyxGOu8+yXpmD0HVJvKOfvn+lpvDJjdrZomJMUYRgIMQ0WYhpmhtoy0eaNNM1YZaNPMnrNrayFqVsRlchqxG1v5hBw9c5zpTSNeoxL1ajHvqN8OU4Zck3qFz07biHPP30yt/e1f5r/OCO6eR6gExXlYuylnTog47asNrvRBn4lZtROeeWGg/Z21YAlENWmx5KzbJXPjsmdub+lRye4eRMw61TJPSNBp5ZGEmgu0yjqwHtM6bQ069G2vqQJNP6DcMByVwuAR0zn4Tn+r9uXqdoR5qcO9uU22sdibPRNWpVGzXvmpW9FD6S0toO5PTIX4Rjvt6/TUYK3T6temM+JnU/IlellvKGdyPSqr3bQKn+gTk9Z9wUHzQMCdk8jWg3oWtS5qKVa6ZdhSMHsUzsn1lmPhideGXvtu/Docg3vpflHxMnSDfel+UfEz2VhTXsrWO4yxvTK1uBnDNuLtP2Sf5af0iUWk5eJ+yT/LT+kSi0nNZfCQxoD/q6H4z/AEtOgGYHQP8A1VH8Z/pM1+mtK07Skaj7zwRB6Tt0HzjG6ltMvlNMSZzHSOtl3UJIqGkvJKYAwPHiZEoa3X1I57YuPu1VDD28ffOV/Jx+k26sYhpjtE+UKg5C3KGi3DtFy9I+PNffNdSrK6h0YMrDKspBBHcZvHPHL4UGmb100obe2wpw9U9mp5qMecfZu9c0bTBeVAkC2PL672+ZM8t1jS/DD1WyJUXUlmvI1dfnPJHKoOzBHdmFN7HqASp1nu7anbOtyA6VFKiid5qeHTlv5Tl+kNe71ldaVZkpE+YxCGqF6bYH+/fM19Pq1KoepUeo2cFndmOOmSZ1y/IlmpG7dI2kdEAHNNt33W3++J0Zq/UrVEpjzmc4VE9Jj4nh4zZavao3N8Q+Oyo/3rg7x+4PtfCdS0Jq7bWabFOmCxxt1HAZ39fIdwmcOPLI0p9UdSqVmq1K2w9UDKrxp0vD7zd8w3lI0h9MvMZzRt9pKYB9JvtN7p1HTIpW1CtX7NCNjeNkb3Pmr7yJxe4p5JMx+Tl0kwxVFt6IXgo9gnUtV9cV2EpXbYYblrAbscg4HA985za08nfyk2onOefj5csLuI7gjAgEEEEZBByCOsg358/8o+JkPUna+gUNvjh8fh222fdiStInz/yj4mfXxy7Yy/YxutemRQZUXecq9TuTPDxOD/wx1XDJkbwRkHqDKzWbRFWpWd0wVfB3krskKF9m6TbKj2dFaec7CKueuBiePtlcsttRo6f7JPwJ8BM3pe5UVFpZ85snHcBnfL2tW2LbbxnYo7WOuEzic0as/b06hO0xqrtHqWOG9xnTl5eup9ptt9A0D29E/v8A6GDT+rd7d3NSoK1LscjsQ7NlVwMgKFxxzzk7Qo+tpfi/Qy1q7szrOOZzVMmOOoVxzr0v4XMaqag3HKtRPiHH6GXWk6zDOGYeDETHaUruScux8WJl/wCXjRF01q3XtV2qjUWGcfV1QWH5Tg+wSTqNrC1rXWg7E0KzBcE/s3O4MOgJ4ync7m8P1Eh0qTVKtNEB2nqIq46kgTx8uE4s51R3lpm9edDtd2jBBmrTPaUxzbdvUeI+AmiqMFGWIHLJOJEq1y25cgf3hU4Hh1+E9GerNV1k24ACQTkYIJBB4gjjJKgEb51+61WsqoO3S2mIx2mSr+ORjfM1eeTlCT2d3VUcldFfHrGJ5rx5M+NhPoZ6QTcDyb2/Ovc55/WJ/wCMEdMjxufUKxXdxU8VPP8A3jtCoAQd+45G6QlaSabhePH7ufjGUcdu3aM8oOj6lPLtUoFVGQ9E4JxvClM58N0mXGt1u1m91QYv5xpIGpuv1vQ5HIHa8BOFGuW692OXhOuaG1OLaNWhUqVKddtquFONhKrDdkAZOFwDv6907Y8mdlkdJdste3NWsS1WrUcnf59RiPUOA9UjqyDv8BI1W3qUar0qm50Yqw2toZHQx8MNwwCT1ni7+/YkJXpx3aotuO7vXA9xlXVtXwSoJ5gbsyCXqDP1dTdxwhl+TbsmidZbEU6dPbNEIqoBUBC4Ax6Y3e3ElX1ZXYMjKylBhlYMp3nmJxVHrY2glQd+DiHbaVr0j5rPTP7rYz3Ec/XPTj+TZ6sHT79pXhtxlBojWV67ijVwzNnZcDByBnBA3cj0l0Dumu8ym43F+u+ko/cXkOgmdqaIoo4dUGQcjecA9QOE0FM/Vr+BfgJX3PGdcpLraRM0R+1pfjEmVFYZ4H2TMadrMlpWZWKsKT4ZSVYHHIjhNOh+rT8C/CXDL9FU+kGODlV/iI/WZXSCAnl6mPzmp0nwMyd8d5l7VqRX/QmqHs6a7Tv5qja4nI5kzXap6mVreotxWdVdc7NNQKmMjGSTuz4TI1Xxv75f0PKItnbMLgNVqqB9HUHDVTwwx5Afe+Jnnz6+STJm6lbs0SvnOe1xk7TYUoO4cPhKm41u0ahKveW4YHDL2gYg9DjM4lrBrhfX7HtqxFM8KFMlKQHTA9LxOZRFpvbN5Hd77X/RdEbrjtei0abufbjHvlK/lWss4FC6x97ZpfDbnICTCBhPJXZR5TNHdLj+SPnBOOZgkPJVkKmOHt+Uet6ZbgCfAZiVtlBHPxl1Z02K4XcAM8h7pje/hjSx1Tq21vXFavSFQ0xt0wz4VXH2m3b8cuQ790d01rreXNV2Sq9GmSNhKbFCqjOMsN+Tkk+PdKW92iNkAlj6WN5x0/50jVKyqcwB4kTG8tadL6mkhLpySSxYk5JYkknvJk6jWYjJIVRxYnCj1yPQobPHYz13t8cCNaSpvUVUBJyd+ByHD4zEx3SRLradpoNlCah5bIOD6z8o7ZtdMDWdVSny20LE+G/dLXVDVVQRUqDOOs2GkNHI6bOAFA9k6+K2OmnML3Te/Z2d3WR6V4jfax8PYZp7zVaiSSAzesqsz99qzcf2a+AG+TozeOpNjW7J9sKjNjG1jDY7ppbXSquAN4f7mCST3dZlrHVDSh4U1A/+yoFl1b6naT5tbL3dvUPu7PEswznwS2N3bP8AVpxHmLuIwRu5gjdIly//ADd8o3oLRl3SyLirRqrjzQFYsG/GcEiW1XR1BuKZ/wD0qY+M9MlsVnnuk2lV9kqTgq4BUjoQdxmjW4UoCOGBjpiR6eh7RTtdhSLDgxXaI8CYqtag+g70/wB0bLL7GBx6iImNi3St0lUXB3/GZLSB3nfNbd6KruPNuaY72tdr4OJR3mqNxU43yLn7lpj41DLqijs6IrVBS2xTzk7bDI3DhiV+ktQr6rU7RKttWU4xiqyMF6AEY98u6fk82X22vqznpsIgl7ZaP7AAbTtjqQZLhN7S47cv0rq1cW+TUt6qIM+ev1iAd7AkD1yoNofskH3Gd27XAxk+sznuu+hUTNzRULv+uRR5u/7YA4d/jmc8uOybjGWEYN0I4jB6GJAk4sGGCMiRnp7J6g8JiZbc7NE7BhRWz4wSjqWsmgDSqVKlKir03YsFpjzkzxAHTwmVe6VWClXQ5xhqbr6uEytreXCHNO4r0+5KjAewNvl5ZaXuGIV6zuG807RHA7prLDGe46T3VhbvTZyQ7BySMqjPkDgCAN/X1mHcXFSmcOlTBPmt2bqG/iAx4S40frtc0lCtTosFGzjYKHduxuMh6d1j+mKoNJabKxPm1XqAjgOIGPfMdZf2tyntXPfY6ybojStJGDVUcgH7OyT7yJVJSz0i2p4k1IxMrHWNAaes7gbFF8OBk0nXZqY5kA+kO8ZlqRtcfZOGpUem61KZKuh2lYbiDOg6F1x7VFDKO0wNrkM8yJ2xy36dMMtteLcc/byi1VAeAlSulWPLjzzFi+6gzU1HRatcgcDEm6A55MpHu88d3cI2tyBnfL2TS/FxCNyZQ1tJYHGMtpI4wD7ZexpoKl6Fldc6a2TjHPHGQXvRjjvxwxzldWcPmTa6WlbT/ALxO4buHUwJfORnrwmcYspUsy4Azx4+qM6Q0y+zilgHqRk47o2aX1xpKomcsvAnPhKa71oZdw3nx5zO3GkajcTvO48MCRmJdgBnPMnhnulSrq51jqYIDeceYjI0szU2R8sGBDAnkZU1bcqd5B644RyjgDJMaTamqp2blScj9OXriKwbKqFZmPBVUkkdwE0ujNHJfFuzWixRtktU7YH1FSARNNoPRNXR5Ltsmk2FYU9olMnc2/Jxnp1zOXj97/Tnrfpz8aIvDv8Aolz/ACX+UE7R9IHR/wCW/wAoJ08U+2eriY0cuch6g/d8z5ZjptsDAz6+M6e3k90ed/8A8j1Vz8oseT+x+9c/z/mI8WZpzemO1BOfPGO0XqeG2O4/HMUKRHL2Toq+T21Dh1q3GRwBanjwJCSdo7UmyXJqUmd8ne9xWZWHI7O1sj2cpjxZbaykvty8VAu8nHiCIxUvEJ9Nf4gZ2630LaUvQtrdT1FFM+3GZOXA4ADwE34P9Z04LSV2/Z0qtU9KaM4/7RNFq3qfdVwxYV7RhvV3QBD4IcN751sMesWJrHi1flZ6cu0hqfptRild0qg69n2bfEyg+haxWrEnbqjiVZRVT1Y3j1TuME30jXZxmz1vuE82+tHU/wB7RRsfmRju9RPhJVHW6wc47Y0z0qU3Qe0jE60yKeIB8QDI9TR9BvSo0W8aSH9JPHGu7m3/AKpbVcbFxRbwqLHu1XHpL/EJu30FZHjaWx8ben8oj/29Y/4O0/01L5R417sLVvKQHnVEHi4lXd6ftUG+sp7gczpp1esP8Haf6al8oBoKyHC0th4W9P5R407uJ3WtlHJ2M+JEhnTz1D5tOo3gjGd8TR1uvo0aS+FJB+keFNRwUDwAE10jPauF0ncgFqeMjO8jMJqzLwp5/OAJ0fWLVR6lRq1DZO2SzU2Oydo8dk8N/fiY6/0ZUon62lVp95QlP4hunmyyuN9w3VK9K4q/2tvQXvNWo/sVcRVLV+g37fSFRu6nbuB75IKpyZfaIkqo+2g/MJZys7rZ6pW+jqCinRrlmJ/tcozHuyAPZNFpa8pW9JmqbwRshN205PICcmavSXi4PgIS3hqN9VTq1mP3EZj7prybmjbYrrbVAACqQAACck4HU9YczQ0VpA7/AKFV9qj9YJjrkvauyiHmFAZ60LVo4GkcGLBgO5gzEZh5gOrHAYwpiwYDuYMxvMG1AXCidqDMKMwjBmFmUCETDiTAImJMBMSTAESwzDEViQVlzoK0qnL29Bj1NFM+3EitqrYf4Wh/LEvsRt5nU+hTU9AWaHK21AHr2KZ+EmKiqMKAB0AAEdcxpjNSQDMETmCUWGIlouIeZCIoGIihKhwRYiFjgEACKEICLAgFBFYiGgDMGYgwZlC8wswiYkmA4DCMSphmAhjEEw2iDAWhjsZpx3MlUDGahjpMZqSBljGWMdeMtNIKCJhyqs4hoIJgIhiCCVDiR4Q4JAYihBBCjjbQQSobMIQQShUQYIIClhmCCA20bMEEoVTjsEEzVJaNPBBIGHjLQQTSEZggglH/2Q==")),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(userData.username!),
                subtitle: Text(userData.useremail!),
              ),

              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),

                ),
                child: Row(
                  children: [
                    Icon(Icons.double_arrow_sharp,color: Colors.black),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text("Update setting", style: TextStyle(color: Colors.black),)),
                    SizedBox(
                      width: 110,
                    ),
                    IconButton(
                        style: ButtonStyle(
                            padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10, vertical: 10))
                        ),
                        onPressed: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              User_Update(),));

                        }, icon: Icon(Icons.update, color: Colors.teal,))
                  ],
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Icon(Icons.double_arrow_sharp,color: Colors.black),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text("Delete setting", style: TextStyle(color: Colors.black),)),
                    SizedBox(
                      width: 115,
                    ),
                    IconButton(
                        style: ButtonStyle(
                            padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10, vertical: 10))
                        ),
                        onPressed: () {

                          uServices.UserDelete(userData.userID!, context);

                        }, icon: Icon(Icons.delete, color: Colors.red,))
                  ],
                ),
              ),

              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Icon(Icons.double_arrow_sharp,color: Colors.black),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text("Login An Other Account", style: TextStyle(color: Colors.black),)),
                    SizedBox(
                      width: 50,
                    ),
                    IconButton(
                        style: ButtonStyle(
                            padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10, vertical: 10))
                        ),
                        onPressed: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context) => User_Login(),));
                        }, icon: Icon(Icons.login, color: Colors.green.shade700,))
                  ],
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Icon(Icons.double_arrow_sharp,color: Colors.black),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text("Create New Account", style: TextStyle(color: Colors.black),)),
                    SizedBox(
                      width: 72,
                    ),
                    IconButton(
                        style: ButtonStyle(
                            padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10, vertical: 10))
                        ),
                        onPressed: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context) => User_Register(),));
                        }, icon: Icon(Icons.how_to_reg_outlined, color: Colors.blue.shade700,))
                  ],
                ),
              ),

              Spacer(),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),

                ),
                child: Row(
                  children: [
                    Icon(Icons.double_arrow_sharp,color: Colors.deepOrange),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text("Logout setting", style: TextStyle(color: Colors.deepOrange),)),
                    SizedBox(
                      width: 118,
                    ),
                    IconButton(
                        style: ButtonStyle(
                            padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10, vertical: 10))
                        ),
                        onPressed: () {

                          uServices.UserLogout(context);

                        }, icon: Icon(Icons.logout, color: Colors.deepOrange,))
                  ],
                ),
              ),


            ],
          ),
        );
    },);


    }else if(snapshot.hasError){
    return const Icon(Icons.error_outline);
    }else{

    return Center(child: const CircularProgressIndicator());
    }


    }),


         ),
       );

  }
}
