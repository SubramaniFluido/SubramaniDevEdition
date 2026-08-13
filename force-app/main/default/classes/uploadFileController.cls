public class uploadFileController {
   
	public PageReference readContent() {
        //Here textBody is the blob input file.
		String fileContent = textBody.toString();
		List<string> textfilebody = fileContent.split(' ');
		for(String text: textfilebody) {
            if(text.contains('https://') || text.contains('http://')){
            	String url = '(?:(?:(?:[a-z0-9]{3,9}:(?://)?)(?:[-;:&=+$,w]+@)?[a-z0-9.-]+|(?:www.|[-;:&=+$??,w]+@)[a-z0-9.-]+)((?:/[+~%/.w-]*)?\\??(?:[-+=&;%@.w]*)#?w*)?)';
                Pattern urlPattern = Pattern.compile(url);
            	Matcher urlMatcher = urlPattern.matcher(text);
                while(urlMatcher.find()) { 
                    System.debug(urlMatcher.group());
                }
            }
            //if(text.contains('.')){
                String domainName= '/^[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9].[a-zA-Z]{2,}$/';
                Pattern domainPattern = Pattern.compile(domainName);
            	Matcher domainMatcher = domainPattern.matcher(text);
                while(domainMatcher.find()) { 
                    System.debug(domainMatcher.group());
                }
            //}
		}
        return null;
	}
	public blob textBody { get; set; }

}