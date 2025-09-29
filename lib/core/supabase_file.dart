import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> supabaseInit() async {
  await Supabase.initialize(
    url: "https://hkxtaqbisnboczqhsodv.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhreHRhcWJpc25ib2N6cWhzb2R2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTg5ODAyNzgsImV4cCI6MjA3NDU1NjI3OH0.GG_6EePGeRjs2aSU90wZZ67bS8GpiSbVs-R25fmycnI",
    authOptions: const FlutterAuthClientOptions(
      autoRefreshToken: true,
      detectSessionInUri: true,
    ),
  );
}

