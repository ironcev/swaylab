; ModuleID = 'Play07.cpp'
source_filename = "Play07.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.A = type { i32, i32 }

@__const.main.a = private unnamed_addr constant %struct.A { i32 3333, i32 4444 }, align 4

; Function Attrs: mustprogress noinline nounwind uwtable
define dso_local void @_Z3foo1ARS_(i64 %0, %struct.A* noundef nonnull align 4 dereferenceable(8) %1) #0 {
  %3 = alloca %struct.A, align 4
  %4 = alloca %struct.A*, align 8
  %5 = bitcast %struct.A* %3 to i64*
  store i64 %0, i64* %5, align 4
  store %struct.A* %1, %struct.A** %4, align 8
  %6 = getelementptr inbounds %struct.A, %struct.A* %3, i32 0, i32 0
  store i32 1111, i32* %6, align 4
  %7 = getelementptr inbounds %struct.A, %struct.A* %3, i32 0, i32 1
  store i32 2222, i32* %7, align 4
  %8 = load %struct.A*, %struct.A** %4, align 8
  %9 = getelementptr inbounds %struct.A, %struct.A* %8, i32 0, i32 0
  store i32 3333, i32* %9, align 4
  ret void
}

; Function Attrs: mustprogress noinline norecurse nounwind uwtable
define dso_local noundef i32 @main() #1 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.A, align 4
  %3 = alloca %struct.A, align 4
  store i32 0, i32* %1, align 4
  %4 = bitcast %struct.A* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 4 bitcast (%struct.A* @__const.main.a to i8*), i64 8, i1 false)
  %5 = bitcast %struct.A* %3 to i8*
  %6 = bitcast %struct.A* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 4 %6, i64 8, i1 false)
  %7 = bitcast %struct.A* %3 to i64*
  %8 = load i64, i64* %7, align 4
  call void @_Z3foo1ARS_(i64 %8, %struct.A* noundef nonnull align 4 dereferenceable(8) %2)
  ret i32 0
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { mustprogress noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress noinline norecurse nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
