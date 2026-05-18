public class A {
    String getUrl() {
        return 'https://redirect.' + getType() + '.' +
            'example.com' +
            '/' + UserInfo.getOrganizationId() +
            '/complete?target=' + target;
    }
}
