package demo.features;
import com.intuit.karate.junit5.Karate;

class UsersRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("Post").relativeTo(getClass());
    } 
    
    @Karate.Test
    Karate testTags() {
        return Karate.run("GetCallDemo").tags("@debug").relativeTo(getClass());
    } 

}
