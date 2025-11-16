This file is a merged representation of the entire codebase, combined into a single document by Repomix.

# File Summary

## Purpose
This file contains a packed representation of the entire repository's contents.
It is designed to be easily consumable by AI systems for analysis, code review,
or other automated processes.

## File Format
The content is organized as follows:
1. This summary section
2. Repository information
3. Directory structure
4. Repository files (if enabled)
5. Multiple file entries, each consisting of:
  a. A header with the file path (## File: path/to/file)
  b. The full contents of the file in a code block

## Usage Guidelines
- This file should be treated as read-only. Any changes should be made to the
  original repository files, not this packed version.
- When processing this file, use the file path to distinguish
  between different files in the repository.
- Be aware that this file may contain sensitive information. Handle it with
  the same level of security as you would the original repository.

## Notes
- Some files may have been excluded based on .gitignore rules and Repomix's configuration
- Binary files are not included in this packed representation. Please refer to the Repository Structure section for a complete list of file paths, including binary files
- Files matching patterns in .gitignore are excluded
- Files matching default ignore patterns are excluded
- Files are sorted by Git change count (files with more changes are at the bottom)

# Directory Structure
```
color.html
fedwiki-java.iml
input.txt
jackson-annotations-2.14.2.jar
jackson-core-2.14.2.jar
jackson-databind-2.14.2.jar
Main.class
Main.java
Main$Action.class
Main$Item.class
Main$Page.class
Main$PageInfo.class
Main$Panel.class
Main$SiteMap.class
output.txt
README.md
run.sh
test.sh
```

# Files

## File: fedwiki-java.iml
````
<?xml version="1.0" encoding="UTF-8"?>
<module type="JAVA_MODULE" version="4">
  <component name="NewModuleRootManager" inherit-compiler-output="true">
    <exclude-output />
    <content url="file://$MODULE_DIR$">
      <sourceFolder url="file://$MODULE_DIR$" isTestSource="false" />
    </content>
    <orderEntry type="inheritedJdk" />
    <orderEntry type="sourceFolder" forTests="false" />
    <orderEntry type="library" name="fedwiki-java" level="project" />
  </component>
</module>
````

## File: color.html
````html
<pre id=report style="white-space: pre-wrap;">working</pre>
<script type=module>

  import * as frame from 'http://code.fed.wiki/assets/v1/frame.js'

  const ansi = {
    '30': 'BLACK',
    '31': 'RED',
    '32': 'GREEN',
    '33': 'LIMEGREEN',
    '34': 'BLUE',
    '35': 'PURPLE',
    '36': 'DARKCYAN',
    '37': 'WHITE'
  }
  const url = 'http://ward.dojo.fed.wiki/assets/pages/federation-browser-in-java/output.txt'
  const text = await fetch(url).then(res => res.text())

  window.doopen = event =>
    window.parent.postMessage({
      action:"doInternalLink",
      title: event.target.textContent,
      site: event.target.dataset.site,
      keepLineup: event.shiftKey
    }, "*")

  let tail = ''
  window.report.innerHTML = text.split(/\n/)
    .map(line => {
      const summary = line.match(/ << \d+ case (.*?) >>/)
      if(summary) {
        const head = `${tail}<details><summary>${summary[1]}</summary>`
        tail = `</details>`
        return head
      }
      const head = line.match(/^(.*?)\u001b\[32m (.*?)\u001b\[0m/)
      if (head) {
        return `<img width=10 src="http://${head[2]}/favicon.png"> <span data-site=${head[2]} onclick=doopen(event)>${head[1]}</span>\n`
      }
      return line
        .replace(/&/g,'&amp;')
        .replace(/</g,'&lt;')
        .replace(/\u001b\[(.*?)m/ig, (_,n) => n!='0' ? `<font color=${ansi[n]}>` : `</font>`)
        .replace(/$/,"\n")
    })
    .join("")+tail
</script>
````

## File: run.sh
````bash
#!/bin/sh
# usage: [DEBUG=1|2] sh run.sh [site]

if [ "$DEBUG" = "1" ]; then
  JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005"
elif [ "$DEBUG" = "2" ]; then
  JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"
else
  JAVA_OPTS=""
fi

java $JAVA_OPTS \
  -cp "jackson-core-2.14.2.jar:jackson-annotations-2.14.2.jar:jackson-databind-2.14.2.jar:." \
  Main "$1"
````

## File: test.sh
````bash
#!/bin/sh
# run test data as command input
# usage: [DEBUG=1|2] sh test.sh [site]

SITE=${1:-ward.dojo.fed.wiki}   # default to 'ward.dojo.fed.wiki' if no argument passed

cat input.txt | DEBUG=$DEBUG sh run.sh "$SITE"
````

## File: output.txt
````
Welcome to this [[Federated Wiki]] site. From this page you can find who we are and what we do. New sites provide this information and then claim the site as their own. You will need your own site to participate.
[36m << 1 case find pages we share >>[0m
[36m << 2 find share >>[0m
Pages where we do and share.
[36m << 3 next >>[0m
[[Dojo Practice Yearbooks]]
[36m << 4 link >>[0m

Welcome Visitors[32m ward.dojo.fed.wiki[0m
Dojo Practice Yearbooks[32m ward.dojo.fed.wiki[0m
==========================================
We make pages here mostly for the making experience.
[36m << 5 find 2020 >>[0m
[[Dojo Practices 2020]] with diagrams
[36m << 6 link >>[0m

Welcome Visitors[32m ward.dojo.fed.wiki[0m
Dojo Practice Yearbooks[32m ward.dojo.fed.wiki[0m
Dojo Practices 2020[32m ward.dojo.fed.wiki[0m
==========================================
We make pages here mostly for the making experience.
[36m << 7 test experience >>[0m
[36m << 8 case browse from forked page >>[0m
[36m << 9 find Embodiment >>[0m
[[Embodiment Hypothesis]] 2015 Lakoff's life in linguistics.
[36m << 10 link >>[0m

Welcome Visitors[32m ward.dojo.fed.wiki[0m
Dojo Practice Yearbooks[32m ward.dojo.fed.wiki[0m
Dojo Practices 2020[32m ward.dojo.fed.wiki[0m
Embodiment Hypothesis[32m ward.dojo.fed.wiki[0m
==========================================
George Lakoff: How Brains Think: The Embodiment Hypothesis.
[36m << 11 find See >>[0m
See [[Constructionism]]
[36m << 12 link >>[0m
[33m << eric.dojo.fed.wiki >>[0m
[33m << wiki.dbbs.co >>[0m

Welcome Visitors[32m ward.dojo.fed.wiki[0m
Dojo Practice Yearbooks[32m ward.dojo.fed.wiki[0m
Dojo Practices 2020[32m ward.dojo.fed.wiki[0m
Embodiment Hypothesis[32m ward.dojo.fed.wiki[0m
Constructionism[32m wiki.dbbs.co[0m
==========================================
Constructionist learning is when learners construct mental models to understand the world around them. It advocates student-centered, discovery learning where students use information they already know to acquire more knowledge. Students learn through participation in project-based learning where they make connections between different ideas and areas of knowledge facilitated by the teacher through coaching rather than using lectures or step-by-step guidance. [https://en.wikipedia.org/wiki/Constructionism_(learning_theory) wikipedia]
[36m << 13 find Papert >>[0m
See [[Seymour Papert]]
[36m << 14 link >>[0m
[33m << wiki.dbbs.co >>[0m

Welcome Visitors[32m ward.dojo.fed.wiki[0m
Dojo Practice Yearbooks[32m ward.dojo.fed.wiki[0m
Dojo Practices 2020[32m ward.dojo.fed.wiki[0m
Embodiment Hypothesis[32m ward.dojo.fed.wiki[0m
Constructionism[32m wiki.dbbs.co[0m
Seymour Papert[32m wiki.dbbs.co[0m
==========================================
Marvin Minsky (left) and Seymour Papert in 1971
[36m << 15 case try unicode letters >>[0m
[36m << 16 back Yearbooks >>[0m
[[Dojo Practices 2020]] with diagrams
[36m << 17 next >>[0m
[[Dojo Practices 2021]] with scripts 
[36m << 18 link >>[0m

Welcome Visitors[32m ward.dojo.fed.wiki[0m
Dojo Practice Yearbooks[32m ward.dojo.fed.wiki[0m
Dojo Practices 2021[32m ward.dojo.fed.wiki[0m
==========================================
We make pages here mostly for the making experience.
[36m << 19 find Icosahedron >>[0m
[[Cartesian Icosahedron]] enumerated vertices.
[36m << 20 link >>[0m

Welcome Visitors[32m ward.dojo.fed.wiki[0m
Dojo Practice Yearbooks[32m ward.dojo.fed.wiki[0m
Dojo Practices 2021[32m ward.dojo.fed.wiki[0m
Cartesian Icosahedron[32m ward.dojo.fed.wiki[0m
==========================================
The following Cartesian coordinates define the vertices of an icosahedron with edge-length 2, centered at the origin:


[36m << 21 next >>[0m
Icosahedron
[36m << 22 next >>[0m
(0, Âą1, Âąđ)
(Âą1, Âąđ, 0)
(Âąđ, 0, Âą1)

where đ = (1 + â5) / 2 is the golden ratio.
[36m << 23 case remote page as context >>[0m
[36m << 24 back Welcome >>[0m
[[Dojo Practice Yearbooks]]
[36m << 25 find Read >>[0m
You can edit your copy of these pages. Press [+] to add more writing spaces. Read [[How to Wiki]] for more ideas. Follow [[Recent Changes]] here and nearby.
[36m << 26 link >>[0m

Welcome Visitors[32m ward.dojo.fed.wiki[0m
How To Wiki[32m ward.dojo.fed.wiki[0m
==========================================
Here we describe how to use the web interface to the federated wiki. Read [[About Federated Wiki]] to learn about the project. If you are just starting to write in your first wiki then read the [[Field Guide to the Federation]].
[36m << 27 link >>[0m
[33m << fed.wiki.org >>[0m

Welcome Visitors[32m ward.dojo.fed.wiki[0m
How To Wiki[32m ward.dojo.fed.wiki[0m
About Federated Wiki[32m fed.wiki.org[0m
==========================================
We remain excited about this platform and have become increasingly confident that it embodies important new ideas. We will explain.
[36m << 28 find Mixed >>[0m
[[Mixed Content]] on pages sufficient to get work done.
[36m << 29 link >>[0m
[33m << fed.wiki.org >>[0m
[33m << about.fed.wiki >>[0m

Welcome Visitors[32m ward.dojo.fed.wiki[0m
How To Wiki[32m ward.dojo.fed.wiki[0m
About Federated Wiki[32m fed.wiki.org[0m
Mixed Content[32m about.fed.wiki[0m
==========================================
Wiki extends its twenty year old namesake by providing an unbounded complement of markups of which only a few offer specific syntax for formatting text. The remaining markups configure plugins to show or do work we usually associate with applications.
[36m << 30 find Formatting >>[0m
See [[Formatting Strengths]] of various text markups.
[36m << 31 link >>[0m
[33m << about.fed.wiki >>[0m

Welcome Visitors[32m ward.dojo.fed.wiki[0m
How To Wiki[32m ward.dojo.fed.wiki[0m
About Federated Wiki[32m fed.wiki.org[0m
Mixed Content[32m about.fed.wiki[0m
Formatting Strengths[32m about.fed.wiki[0m
==========================================
Wiki offers various markups for formatting text, each with a corresponding plugin that performs the transformation, and each with its own speciality. All implement the same markup for our specialty, the [[Collaborative Link]].
[36m << 32 case reference plugin as context >>[0m
[36m << 33 back Welcome >>[0m
You can edit your copy of these pages. Press [+] to add more writing spaces. Read [[How to Wiki]] for more ideas. Follow [[Recent Changes]] here and nearby.
[36m << 34 find Yearbooks >>[0m
[[Dojo Practice Yearbooks]]
[36m << 35 link >>[0m

Welcome Visitors[32m ward.dojo.fed.wiki[0m
Dojo Practice Yearbooks[32m ward.dojo.fed.wiki[0m
==========================================
We make pages here mostly for the making experience.
[36m << 36 find 2022 >>[0m
[[Dojo Practices 2022]] with graphs
[36m << 37 link >>[0m

Welcome Visitors[32m ward.dojo.fed.wiki[0m
Dojo Practice Yearbooks[32m ward.dojo.fed.wiki[0m
Dojo Practices 2022[32m ward.dojo.fed.wiki[0m
==========================================
We make pages here mostly for the making experience.
[36m << 38 find Mock >>[0m
[[Mock Graph Data]] to test new neo4j import.
[36m << 39 link >>[0m

Welcome Visitors[32m ward.dojo.fed.wiki[0m
Dojo Practice Yearbooks[32m ward.dojo.fed.wiki[0m
Dojo Practices 2022[32m ward.dojo.fed.wiki[0m
Mock Graph Data[32m ward.dojo.fed.wiki[0m
==========================================
We wrote a mock data generator that was designed to push data into an aggregator, unlike El Dorado that used a pull model. This project never finished but we might reuse the data for other experiments. [https://github.com/WardCunningham/context-map-data/blob/master/regenerate.rb github]
[36m << 40 find Tips >>[0m
Here we collect various mentions of the work we've done observing software through the metadata produced throughout its creation and operation. See [[Tips for Modeling]]
[36m << 41 link >>[0m
[33m << ddd.ward.wiki.org >>[0m

Welcome Visitors[32m ward.dojo.fed.wiki[0m
Dojo Practice Yearbooks[32m ward.dojo.fed.wiki[0m
Dojo Practices 2022[32m ward.dojo.fed.wiki[0m
Mock Graph Data[32m ward.dojo.fed.wiki[0m
Tips for Modeling[32m ddd.ward.wiki.org[0m
==========================================
We suggest an incremental approach where new sources are added to a daily build and explored with ad-hoc queries before choosing a more permanent representation as nodes and relations.
[36m << 42 test incremental >>[0m
[36m << 43 case reference and journal as context >>[0m
[36m << 44 back Yearbooks >>[0m
[[Dojo Practices 2022]] with graphs
[36m << 45 find 2021 >>[0m
[[Dojo Practices 2021]] with scripts 
[36m << 46 link >>[0m

Welcome Visitors[32m ward.dojo.fed.wiki[0m
Dojo Practice Yearbooks[32m ward.dojo.fed.wiki[0m
Dojo Practices 2021[32m ward.dojo.fed.wiki[0m
==========================================
We make pages here mostly for the making experience.
[36m << 47 find India >>[0m
[[Agile India 2021]] keynote presentation.
[36m << 48 link >>[0m

Welcome Visitors[32m ward.dojo.fed.wiki[0m
Dojo Practice Yearbooks[32m ward.dojo.fed.wiki[0m
Dojo Practices 2021[32m ward.dojo.fed.wiki[0m
Agile India 2021[32m ward.dojo.fed.wiki[0m
==========================================
Would you be interested in presenting at the Agile India conference virtually in Nov 2021? I understand you might not be very keen to speak at an Agile event. Few of the original thought leaders have the same reaction. But sometimes if I ask them enough, they do change their minds.
[36m << 49 find Creativity >>[0m
Ward is a computer programmer who believes in radically simplifying methods. He's best known as the inventor of the first wiki, and one of the pioneers of software design patterns and Extreme Programming, not to mention being a co-author of the Agile Manifesto. It's a real privilege to have Ward sharing from his wealth of experience at Agile India in his keynote: [[Creativity Before and After Agile]].
[36m << 50 link >>[0m

Welcome Visitors[32m ward.dojo.fed.wiki[0m
Dojo Practice Yearbooks[32m ward.dojo.fed.wiki[0m
Dojo Practices 2021[32m ward.dojo.fed.wiki[0m
Agile India 2021[32m ward.dojo.fed.wiki[0m
Creativity Before and After Agile[32m ward.dojo.fed.wiki[0m
==========================================
Organisms small and large learn by building a model of the world around them then testing that model against what they see and adjusting accordingly. We'll call this a learning loop. We identify three era in computing based on the nature of this loop and the kind of feedback learning that they support.
[36m << 51 find Synchronization >>[0m
We compare this document's layers of process, technique and responsibility to Woods ten theorems and find one missing. See S4, [[Synchronization Required]] 
[36m << 52 link >>[0m
[33m << norms.ward.asia.wiki.org >>[0m
[33m << code.fed.wiki >>[0m

Welcome Visitors[32m ward.dojo.fed.wiki[0m
Dojo Practice Yearbooks[32m ward.dojo.fed.wiki[0m
Dojo Practices 2021[32m ward.dojo.fed.wiki[0m
Agile India 2021[32m ward.dojo.fed.wiki[0m
Creativity Before and After Agile[32m ward.dojo.fed.wiki[0m
Synchronization Required[32m code.fed.wiki[0m
==========================================
[[S4]]: No single unit, regardless of level or scope, can have sufficient range of adaptive behavior to manage the risk of saturation alone, therefore, alignment and coordination are needed across multiple interdependent units in a network.

[36m << 53 case done >>[0m
[36m << 54 exit >>[0m
````

## File: README.md
````markdown
# fedwiki-java

Read federated wiki pages from the internet with Java. Uses the Jackson library
for JSON (locally downloaded jars) and the built-in HttpClient from JDK 11+.

To run locally:

```
sh run.sh
```

To run a test script locally:

```
sh test.sh
```

# commands

The provided main program reads and executes commands from standard input.
Commands are unique in their first letter so that is all that is required.

- __case *words*__ motivating *words* for subsequent commands.
- __next__ sequence through the items of the current page.
- __test *word*__ confirm that *word* is present in current item.
- __find *word*__ advance through items until *word* is found
- __link__ resume following the first link in the current item.
- __back *word*__ backup lineup to page with *word* in title.
- __exit__ stop command execution and exit main.

# roadmap

Additional capabilites will be added as needs or curiosity motivates.

- Resolve links based on provided context by the "collaborative linking" semantic. ✔︎
- Retain recently viewed pages in a managed lineup. ✔︎
- Accumulate sites as they are encountered to form a neighborhood.
- Search for pages based on neighborhood sitemaps.
- Provide implementations for selected plugins.
- Read about pages for available plugins from the origin site.
````

## File: input.txt
````
case find pages we share
find share
next
link
find 2020
link
test experience
case browse from forked page
find Embodiment
link
find See
link
find Papert
link
case try unicode letters
back Yearbooks
next
link
find Icosahedron
link
next
next
case remote page as context
back Welcome
find Read
link
link
find Mixed
link
find Formatting
link
case reference plugin as context
back Welcome
find Yearbooks
link
find 2022
link
find Mock
link
find Tips
link
test incremental
case reference and journal as context
back Yearbooks
find 2021
link
find India
link
find Creativity
link
find Synchronization
link
case done
exit
````

## File: Main.java
````java
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.Scanner;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.regex.*;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.ObjectMapper;

// I N T E R P R E T E R

public class Main {
  // https://stackoverflow.com/questions/5762491/how-to-print-color-in-console-using-system-out-println
    public static final String ANSI_RESET = "\u001B[0m";
    public static final String ANSI_BLACK = "\u001B[30m";
    public static final String ANSI_RED = "\u001B[31m";
    public static final String ANSI_GREEN = "\u001B[32m";
    public static final String ANSI_YELLOW = "\u001B[33m";
    public static final String ANSI_BLUE = "\u001B[34m";
    public static final String ANSI_PURPLE = "\u001B[35m";
    public static final String ANSI_CYAN = "\u001B[36m";
    public static final String ANSI_WHITE = "\u001B[37m";

  // commands
    static Scanner scanner = new Scanner(System.in);
    static int lineno = 0;

  // pages
    static String slug = "welcome-visitors";
    static String origin = "ward.dojo.fed.wiki";

  // lineup
    static List<Panel> lineup = new ArrayList<>();

  // neighborhood
    static Map<String, SiteMap> neighborhood = new HashMap<>();

  public static void main(String... args) {
    if (args.length > 0) origin = args[0];
    enlarge(origin);
    lineup.add(Panel.load(origin,slug));
    String shown = null;

    while (true) {
      Panel panel = lineup.get(lineup.size()-1);
      Item item = panel.item();
      if(!item.text.equals(shown)) {item.println(); shown = item.text;}
      var cmd = nextLine();
      if (cmd.startsWith("e")) System.exit(0);
      if (cmd.startsWith("c")) System.err.println(cmd);
      if (cmd.startsWith("l")) link(panel);
      if (cmd.startsWith("t")) test(cmd,item);
      if (cmd.startsWith("f")) find(cmd);
      if (cmd.startsWith("b")) back(cmd);
      if (cmd.startsWith("n")) panel.next();
      if (cmd.isEmpty()) panel.next();
    }
  }

// H E L P E R S

  static void log(String msg) {
    System.out.println(ANSI_CYAN + " << " + msg + " >>" + ANSI_RESET);
  }

  static void debug(String msg) {
    System.out.println(ANSI_YELLOW + " << " + msg + " >>" + ANSI_RESET);
  }

  static void trouble(String msg) {
    System.out.println(ANSI_RED + " << " + msg + " >>" + ANSI_RESET);
    System.exit(1);
  }

  static String nextLine() {
    var cmd = scanner.nextLine();
    lineno++;
    if (cmd.length() != 0) log(String.valueOf(lineno) + " " + cmd);
    return cmd;
  }

  static String location() {
    var url = "http://" + origin;
    for(Panel each : lineup) {
      if(each.site.equals(origin))
        url += "/view/" + each.slug;
      else
        url += "/" + each.site + "/" + each.slug;
    }
    return url;
  }

  static void link(Panel panel) {
    lineup.add(Panel.load(panel,panel.link()));
    System.out.println("");
    for(Panel each : lineup)
      System.out.println(each.page.title + ANSI_GREEN + " " + each.site + ANSI_RESET);
    System.out.println("==========================================");
    System.out.println(ANSI_PURPLE + location() + ANSI_RESET);
   }

  static void test (String cmd, Item item) {
    // https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/regex/Pattern.html
    Pattern want = Pattern.compile(cmd.split(" ")[1]);
    Matcher have = want.matcher(item.text);
    boolean pass = have.find();
    if (!pass) trouble("no match");
  }

  static void find (String cmd) {
    var panel = lineup.get(lineup.size()-1);
    Pattern want = Pattern.compile(cmd.split(" ")[1]);
    int last = panel.itemno;
    while(panel.next() != last) {
      Matcher have = want.matcher(panel.item().text);
      if(have.find()) return;
    }
    trouble("item not in story");
  }

  static void back (String cmd) {
    Pattern want = Pattern.compile(cmd.split(" ")[1]);
    while(lineup.size() > 0) {
      var last = lineup.size()-1;
      Matcher have = want.matcher(lineup.get(last).page.title);
      if (have.find()) return;
      lineup.remove(last);
    }
    trouble("title not in lineup");
  }

  static Page fetch(String url) {
    Page page = null;
    try {
      HttpRequest request = HttpRequest.newBuilder()
        .uri(new URI(url))
        .header("User-Agent", "fedwiki-java")
        .version(HttpClient.Version.HTTP_1_1)
        .GET()
        .build();
      HttpResponse<String> response = HttpClient
        .newBuilder()
        .build()
        .send(request, HttpResponse.BodyHandlers.ofString());
      var code = response.statusCode();
      if (code == 200) {
        var mapper = new ObjectMapper();
        page = mapper.readValue(response.body(), Page.class);
      }
    } catch (URISyntaxException | IOException | InterruptedException e) {
      trouble("http error: " + e.getMessage());
    }
    return page;
  }

  static SiteMap fetchSiteMap(String url) {
    SiteMap map = null;
    try {
      HttpRequest request = HttpRequest.newBuilder()
        .uri(new URI(url))
        .header("User-Agent", "fedwiki-java")
        .version(HttpClient.Version.HTTP_1_1)
        .GET()
        .build();
      HttpResponse<String> response = HttpClient
        .newBuilder()
        .build()
        .send(request, HttpResponse.BodyHandlers.ofString());
      var code = response.statusCode();
      if (code == 200) {
        var mapper = new ObjectMapper();
        var infos = mapper.readValue(response.body(), PageInfo[].class);
        map = new SiteMap();
        map.infos = Arrays.asList(infos);
      }
    } catch (URISyntaxException | IOException | InterruptedException e) {
      trouble("http error: " + e.getMessage());
    }
    return map;
  }

  public static void enlarge(String site) {
    if(!neighborhood.containsKey(site)) {
      System.out.println(String.format("Reading SiteMap %s",site));
      var sitemap = fetchSiteMap(String.format("http://%s/system/sitemap.json",site));
      neighborhood.put(site, sitemap);
    }
  }



// R U N T I M E

  private static class Panel {
    public String site;
    public String slug;
    public Page page;
    public int itemno;

    public Panel(String site, String slug) {
      this.site = site;
      this.slug = slug;
    }

    public static Panel load(String site, String slug) {
      var panel = new Panel(site,slug);
      String url = String.format("http://%s/%s.json", site, slug);
      panel.page = Main.fetch(url);
      if(panel.page == null) trouble("can't find page at expected site");
      panel.itemno = 0;
      return panel;
    }

    public static Panel load(Panel from, String slug) {
      var context = from.context();
      if(from.item().site != null) {
        context.remove(from.item().site);
        context.add(0,from.item().site);
      }

      var site = origin;
      while(true) {
        String url = String.format("http://%s/%s.json", site, slug);
        var page = Main.fetch(url);
        if(page != null) {
          var panel = new Panel(site,slug);
          panel.page = page;
          panel.itemno = 0;
          panel.context().forEach((each) -> {
            enlarge(each);
          });
          return panel;
        }
        else {
          if(!context.isEmpty()) {
            site = context.get(0);
            debug(site);
            context.remove(0);
          } else {
            trouble("can't find page in current context");
          }
        }
      }
    }

    public int next () {
      this.itemno = (this.itemno+1) % this.page.story.size();
      return this.itemno;
    }

    public Item item () {
      return this.page.story.get(this.itemno);
    }

    public List<String> context () {
        var context = this.page.context();
      if(!this.site.equals(origin)) {
        context.remove(this.site);
        context.add(0,this.site);
      }
      return context;
    }

    public String link () {
      return this.item().links().get(0);
    }
  }


// F E D E R A T I O N

  @JsonIgnoreProperties(ignoreUnknown = true)
  public static class Page {
    public String title = "Empty";
    public List<Item> story = List.of();
    public List<Action> journal = List.of();

    public List<String> context() {
      List<String> sites = new ArrayList<String>();
      for (int i=journal.size()-1; i>=0; i--)
        if (journal.get(i).site != null && !sites.contains(journal.get(i).site))
          sites.add(journal.get(i).site);
      return sites;
    }
  }

  @JsonIgnoreProperties(ignoreUnknown = true)
  public static class Item {
    public String type;
    public String id;
    public String title;
    public String text = "";
    public String site;
    public String slug;

    private static final Pattern linkPattern = Pattern.compile("\\[\\[(.*?)]]");

    public List<String> links() {
      var matcher = linkPattern.matcher(text);
      if (matcher.find()) {
        var slug = matcher.group(1)
          .replaceAll("\\s", "-")
          .replaceAll("[^A-Za-z0-9-]", "")
          .toLowerCase(Locale.getDefault());
        return List.of(slug);
      }
      return List.of();
    }

    public void println() {
      System.out.println(text);
    }
  }

  @JsonIgnoreProperties(ignoreUnknown = true)
  public static class Action {
    public String type;
    public String id;
    public Long date;
    public Item item;
    public String site;
  }

  @JsonIgnoreProperties(ignoreUnknown = true)
  public static class PageInfo {
    public Long date;
    public String slug;
    public String synopsis;
    public String title;
    public Map<String, String> links;
  }

  @JsonIgnoreProperties(ignoreUnknown = true)
  public static class SiteMap {
    public List<PageInfo> infos = new ArrayList<>();
  }
}
````
