import java.io.*;
import java.net.*;

public class EchoServer {

    public static final String EOT = "\u0004";  // End of Transmission, Конец передачи данных

    public static void main( String[] args ) {
        if ( args.length == 0 )
            System.err.println( "Server port is not specified by 1 argument" );

        int port = Integer.valueOf( args[0] );
        try ( ServerSocket serverSocket = new ServerSocket( port ) ) {
            //noinspection InfiniteLoopStatement
            while ( true ) {
                // Wait for the connection
                Socket client = serverSocket.accept();
                if ( !echo( client ) )
                    break;
            }
        } catch ( IOException e ) {
            e.printStackTrace( System.err );
        }
    }

    private static boolean echo( Socket client ) {
        try ( Socket clientSocket = client;
              BufferedReader sockin = new BufferedReader( new InputStreamReader( clientSocket.getInputStream() ) );
              PrintWriter sockout = new PrintWriter( clientSocket.getOutputStream(), true ) )
        {
            System.out.println( "Connected to client " + clientSocket.getInetAddress() + ":" + clientSocket.getPort() );

            // loop, reading input from the socket and writing
            // the data to the client socket till client closes socket
            for ( String linein = sockin.readLine(); linein != null && !linein.equals( EOT ); linein = sockin.readLine() ) {
                System.out.println( "Received from client: " + linein );
                if ( linein.equals( "_stop_" ) ) {
                    sockout.println( EOT );
                    return false;
                }
                sockout.println( linein );
                System.out.println( "Sent to client: " + linein );
            }
        } catch ( IOException e ) {
            e.printStackTrace( System.err );
        }
        return true;
    }
}
