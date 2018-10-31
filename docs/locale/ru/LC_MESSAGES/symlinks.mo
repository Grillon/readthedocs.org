��          �                      �   ,  �        �     �  �   �    �  *   �     �  �   �  
   �  �   �  D  I  ;   �  �   �  G  g     �
  �   �
  �   �     t     �  �   �    4  *   C     n  �   �  
   3  �   >  D  �  ;      �   \   Custom domains Custom domains add a bit of difficulty, because at the nginx layer we don't know what documentation to serve. When someone requests ``http://docs.fabfile.org/en/latest/``, we can't look at the URL to know to serve the ``fabric`` docs. For subdomains, this is a simple lookup of the project slug, using the subdomain portion of the request's hostname. This doesn't require symlinks, but it shows the basic logic that we need to replicate. How we use symlinks Nginx Notice that nowhere in the above path is the project's slug mentioned. It is simply there in the symlink in the cnames directory, and the docs are served from there. Read the Docs stays highly available by serving all documentation pages out of nginx. This means that they never hit our Python layer, meaning that they never hit our database. This reduces the total number of servers to serve a request to 1, each of which is redundant. Requests to a ``readthedocs.io`` subdomain Requests to a custom domain So, when we get a request for ``docs.fabfile.org`` in the future, we will be able to serve it directly from nginx. In this example, $host would be ``docs.fabfile.org``: Subdomains The ``@fallback`` directive is hit when we don't find the proper file. This will cause things to hit the Python backend, so that proper action can be taken. This is where symlinks come in. When someone requests ``http://docs.fabfile.org/en/latest/`` the first time, it hits the Python layer. In that Python layer we record that ``docs.fabfile.org`` points at ``fabric``. When we build the ``fabric`` docs, we create a symlink for all domains that have pointed at ``fabric`` before. We handle a couple of different types of requests in nginx: When a user navigates to ``http://pip.readthedocs.org/en/latest/``, we know that they want the pip documentation. So we simply serve them the documentation: Project-Id-Version:  readthedocs-docs
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-09-17 19:05-0500
PO-Revision-Date: 2018-09-18 00:29+0000
Last-Translator: Anthony <aj@ohess.org>
Language: ru
Language-Team: Russian (http://www.transifex.com/readthedocs/readthedocs-docs/language/ru/)
Plural-Forms: nplurals=4; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<12 || n%100>14) ? 1 : n%10==0 || (n%10>=5 && n%10<=9) || (n%100>=11 && n%100<=14)? 2 : 3)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 Custom domains Custom domains add a bit of difficulty, because at the nginx layer we don't know what documentation to serve. When someone requests ``http://docs.fabfile.org/en/latest/``, we can't look at the URL to know to serve the ``fabric`` docs. For subdomains, this is a simple lookup of the project slug, using the subdomain portion of the request's hostname. This doesn't require symlinks, but it shows the basic logic that we need to replicate. How we use symlinks Nginx Notice that nowhere in the above path is the project's slug mentioned. It is simply there in the symlink in the cnames directory, and the docs are served from there. Read the Docs stays highly available by serving all documentation pages out of nginx. This means that they never hit our Python layer, meaning that they never hit our database. This reduces the total number of servers to serve a request to 1, each of which is redundant. Requests to a ``readthedocs.io`` subdomain Requests to a custom domain So, when we get a request for ``docs.fabfile.org`` in the future, we will be able to serve it directly from nginx. In this example, $host would be ``docs.fabfile.org``: Subdomains The ``@fallback`` directive is hit when we don't find the proper file. This will cause things to hit the Python backend, so that proper action can be taken. This is where symlinks come in. When someone requests ``http://docs.fabfile.org/en/latest/`` the first time, it hits the Python layer. In that Python layer we record that ``docs.fabfile.org`` points at ``fabric``. When we build the ``fabric`` docs, we create a symlink for all domains that have pointed at ``fabric`` before. We handle a couple of different types of requests in nginx: When a user navigates to ``http://pip.readthedocs.org/en/latest/``, we know that they want the pip documentation. So we simply serve them the documentation: 